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
  final storage = new FlutterSecureStorage();

  Future<bool> logIn({
    required String username,
    required String password,
  }) async {
    var logincred = new Map();
    logincred['email'] = username;
    logincred['password'] = password;
    try {
      var response = await http.post(
          '${URL}/user/login',
          headers: {
            "Accept": "application/json",
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: json.encode({"email": username, "password": password}));
      if (response.statusCode! == 200) {
        String data = json.decode(response.body)['access_token'];
        await storage.write(key: 'jwt', value: data);
        return true;
      } else {
        return false;
      }
    }
    catch (error) {
      print(error.toString());
      return false;
    }
  }

  void logOut() {

  }

  Future<String?> get jwt_token async {
    return await storage.read(key: 'jwt');
  }

  Future<User?> get user async {
    if (await jwt_token == null) { return null; }
    int id = JwtDecoder.decode((await jwt_token)!)['id'];
    var response = await http.get(
        '${URL}/user/${id}',
        headers: {"Accept": "application/json", HttpHeaders.contentTypeHeader: 'application/json'});
    if (response.statusCode! == 200) {}
    User user = User.fromJson(json.decode(response.body));
    print(json.decode(response.body));
    return user;
  }
}
