part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthorizedState extends AuthState {
  final User _user;

  User get user => _user;

  AuthorizedState(this._user);
}
class NotAuthorizedState extends AuthState {}