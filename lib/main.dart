import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/blocs/tab/tab_bloc.dart';
import 'package:app/pages/hose_screen.dart';
import 'package:app/pages/new_post.dart';
import 'package:app/pages/onboarding/onboarding/onboarding_main.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:app/repository/post.dart';
import 'package:app/repository/user_repository.dart';
import 'package:app/routes.dart';
import 'package:app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/auth/auth_bloc.dart';

void main() {
  AuthenticationRepository authRep = AuthenticationRepository();
  runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PostRepository>(
              create: (context) => PostRepository(authRep)),
          RepositoryProvider<UserRepository>(
              create: (context) => UserRepository()),
          RepositoryProvider<AuthenticationRepository>(
              create: (context) => authRep),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PostBloc>(
              create: (BuildContext context) => PostBloc(
                postRepository: RepositoryProvider.of<PostRepository>(context))
              ..add(PostsLoadEvent())),
            BlocProvider<TabBloc>(
              create: (BuildContext context) => TabBloc()
            ),
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(RepositoryProvider.of<AuthenticationRepository>(context))
            )
          ],
          child: App()
      )
    )
  );
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.data == null) {
          return const LoadingIndicator();
        }
        final passedOnboarding = snapshot.data!.getBool('passedOnboarding');
        return MaterialApp(
          title: 'Flutter train Twitter',
          initialRoute: passedOnboarding == null || passedOnboarding == false ? AppRoutes.onboarding : AppRoutes.home,
          routes: {
            AppRoutes.onboarding: (context) => OnBoardingMain(),
            AppRoutes.home: (context) => HomeScreen(),
            AppRoutes.new_post: (context) => NewPostPage()
          },
        );
      },
    );
  }
}
