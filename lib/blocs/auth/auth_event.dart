part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckAuth extends AuthEvent {

}

class LoginEvent extends AuthEvent {
  final String login;
  final String password;

  LoginEvent({required this.login, required this.password});
}

class LogoutEvent extends AuthEvent {

}

class RegistrationEvent extends AuthEvent {
  final String login;
  final String password;
  final String email;
  final String website;
  final String firstname;
  final String lastname;

  RegistrationEvent(
      {
        required this.login,
        required this.password,
        required this.email,
        required this.website,
        required this.firstname,
        required this.lastname
      }
  );
}

class EditProfile extends AuthEvent {
  final String firstname;
  final String lastname;
  final String website;

  EditProfile({
    required this.firstname,
    required this.lastname,
    required this.website});
}