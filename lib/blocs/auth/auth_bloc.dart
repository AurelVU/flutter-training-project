import 'dart:async';

import 'package:app/models/user.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthenticationRepository authenticationRepository;

  Future<User?> get user async => await authenticationRepository.user;

  AuthBloc(AuthenticationRepository authenticationRepository)
      : super(NotAuthorizedState()) {
    this.authenticationRepository = authenticationRepository;
    on<LoginEvent>((event, emit) async {
      await authenticationRepository
          .logIn(username: event.login, password: event.password)
          .then((is_authorized) async => {
                if (is_authorized == true)
                  {emit(AuthorizedState(await authenticationRepository.user))}
                else
                  {emit(NotAuthorizedState())}
              });
    });
    on<RegistrationEvent>((event, emit) {
      user.then((value) => emit(AuthorizedState(value)));
    });
    on<LogoutEvent>((event, emit) {
      emit(NotAuthorizedState());
    });
    on<CheckAuth>((event, emit) async {
      User? user = await authenticationRepository.user;
      if (user != null) {
        emit(AuthorizedState(user));
      } else {
        emit(NotAuthorizedState());
      }
    });
  }
}
