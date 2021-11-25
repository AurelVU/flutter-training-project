import 'package:app/blocs/auth/auth_bloc.dart';
import 'package:app/widgets/auth_content.dart';
import 'package:app/widgets/loading_indicator.dart';
import 'package:app/widgets/profile_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      if (AuthState is AuthorizedState) {
        return ProfileContent();
      }
      if (AuthState is NotAuthorizedState) {
        return AuthorizationContent();
      }
      return LoadingIndicator();
    });
  }
}
