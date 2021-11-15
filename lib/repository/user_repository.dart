import 'package:app/models/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
          () => _user = User(id: 1, username: 'test', email: 'test@test.test', firstname: 'Ivan', lastname: 'Ivanov', link: 'http://google.com'),
    );
  }
}