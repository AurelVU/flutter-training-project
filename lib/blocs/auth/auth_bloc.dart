import 'dart:async';

import 'package:app/models/user.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthenticationRepository authenticationRepository;
  User? _user;

  User? get user => _user;

  AuthBloc(AuthenticationRepository authenticationRepository)
      : super(NotAuthorizedState()) {
    this.authenticationRepository = authenticationRepository;
    on<LoginEvent>((event, emit) async {
      await authenticationRepository
          .logIn(username: event.login, password: event.password)
          .then((is_authorized) => {
                if (is_authorized == true)
                  {
                    emit(AuthorizedState(_user))
                  }
                else
                  {
                    emit(NotAuthorizedState())
                  }
              });
    });
    on<RegistrationEvent>((event, emit) {
      _user = _user = User(
          id: 55,
          email: event.email,
          link: event.website,
          firstname: event.firstname,
          lastname: event.lastname,
          username: event.login);

      emit(AuthorizedState(_user!));
    });
    on<LogoutEvent>((event, emit) {
      emit(NotAuthorizedState());
    });
  }
}
