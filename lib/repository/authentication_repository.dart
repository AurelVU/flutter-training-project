import 'dart:async';
import 'dart:io';
import 'package:app/models/user.dart';
import 'package:app/src/const.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final storage = const FlutterSecureStorage();

  Future<String?> get jwtToken async {
    return await storage.read(key: 'jwt');
  }

  Future<User?> get user async {
    if (await jwtToken == null) {
      return null;
    }
    int id = JwtDecoder.decode((await jwtToken)!)['id'];
    var url = Uri.https(URL, '/user/$id');
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      User user = User.fromJson(json: json.decode(response.body), userId: id);
      return user;
    } else {
      return null;
    }
  }

  Future<bool> logIn({
    required String username,
    required String password,
  }) async {
    var loginCred = {};
    loginCred['email'] = username;
    loginCred['password'] = password;
    try {
      var url = Uri.https(URL, '/user/login');
      var response = await http.post(url,
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: json.encode({"email": username, "password": password}));
      if (response.statusCode == 200) {
        String data = json.decode(response.body)['access_token'];
        await storage.write(key: 'jwt', value: data);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<bool> editProfile({
    required String firstname,
    required String lastname,
    required String website,
  }) async {
    var editProfileData = {};
    editProfileData['firstname'] = firstname;
    editProfileData['lastname'] = lastname;
    editProfileData['website'] = website;
    try {
      User? current_user = await user;
      var url = Uri.https(URL, '/user/${current_user!.id.toString()}');
      var response = await http.put(url,
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer ${await jwtToken}'
          },
          body: json.encode(editProfileData));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  void logOut() {
    storage.delete(key: 'jwt');
  }

  Future<bool> registration(
      {required String username,
      required String password,
      required String firstname,
      required String lastname,
      required String website}) async {
    var url = Uri.https(URL, '/user/registration');
    var response = await http.post(url,
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode({
          "nickname": username,
          "password": password,
          "lastname": lastname,
          "website": website,
          "firstname": firstname
        }));
    return response.statusCode >= 200 && response.statusCode < 300;
  }
}
