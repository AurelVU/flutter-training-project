import 'dart:async';

import 'package:app/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  User? _user;

  User? get user => _user;

  AuthBloc() : super(NotAuthorizedState()) {
    on<AuthEvent>((event, emit) {
      try {
        if (event is LoginEvent) {
          _user = User(
              id: 55,
              email: 'test@test.test',
              link: 'https://google.com',
              firstname: 'Vladimir',
              lastname: 'Ushakov',
              username: event.login
          );

          emit(AuthorizedState(_user!));
        } else if (event is RegistrationEvent) {
          _user = _user = User(
              id: 55,
              email: event.email,
              link: event.website,
              firstname: event.firstname,
              lastname: event.lastname,
              username: event.login);

          emit(AuthorizedState(_user!));
        } else if (event is LogoutEvent) {
          emit(NotAuthorizedState());
        }
      } catch (e) {
        emit(NotAuthorizedState());
      }
    });
  }
}
