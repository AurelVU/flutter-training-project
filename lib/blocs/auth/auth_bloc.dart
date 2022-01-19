import 'dart:async';

import 'package:app/blocs/tab/tab_bloc.dart';
import 'package:app/models/user.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthenticationRepository authenticationRepository;
  TabBloc tabBloc;

  Future<User?> get user async => await authenticationRepository.user;

  AuthBloc(this.authenticationRepository, this.tabBloc)
      : super(NotAuthorizedState()) {
    on<LoginEvent>((event, emit) async {
      await authenticationRepository.logIn(
          username: event.login,
          password: event.password
      ).then((isAuthorized) async =>
      {
        if (isAuthorized == true)
          {emit(AuthorizedState(await authenticationRepository.user))}
        else
          {emit(NotAuthorizedState())}
      });
    });

    on<RegistrationEvent>((event, emit) async {
      bool status = await authenticationRepository.registration(
          username: event.login,
          password: event.password,
          firstname: event.firstname,
          lastname: event.lastname,
          website: event.website);
      if (status) {
        tabBloc.add(ToAuthorizationEvent());
      }
    });

    on<LogoutEvent>((event, emit) {
      authenticationRepository.logOut();
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

    on<EditProfile>((event, emit) async {
      bool status = await authenticationRepository.editProfile(
          firstname: event.firstname,
          lastname: event.lastname,
          website: event.website,
          path: event.imagePath
      );
      if (status) {
        emit(UpdateUserDataInProgressState());
        emit(AuthorizedState(await authenticationRepository.user));
      }
      print('${event.firstname} ${event.lastname} ${event.website}');
    });
  }
}
