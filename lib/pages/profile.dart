import 'package:app/repository/authentication_repository.dart';
import 'package:app/widgets/auth_content.dart';
import 'package:app/widgets/profile_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: RepositoryProvider.of<AuthenticationRepository>(context).status,
        builder: (BuildContext context,
            AsyncSnapshot<AuthenticationStatus> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Empty data');
              break;
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                if (snapshot.data == AuthenticationStatus.authenticated) {
                  return ProfileContent();
                } else {
                  return AuthorizationContent();
                }
              }
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                if (snapshot.data == AuthenticationStatus.authenticated) {
                  return ProfileContent();
                } else {
                  return AuthorizationContent();
                }
              }
              break;
          }
          return const Text('None');
        });
  }
}
