import 'dart:async';
import 'package:app/src/const.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<bool> logIn ({
    required String username,
    required String password,
  }) async {
    var logincred = new Map();
    logincred['email']=username;
    logincred['password']=password;
    var response = await http.post(
        '${URL}/user/login',
        headers: {"Accept": "application/json"},
        body:logincred);
    if (response.statusCode == 500) {
      return true;
    } else { return false; }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
