import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/blocs/tab/tab_bloc.dart';
import 'package:app/pages/hose_screen.dart';
import 'package:app/pages/onboarding/onboarding/onboarding_main.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:app/repository/post.dart';
import 'package:app/repository/user_repository.dart';
import 'package:app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PostRepository>(
              create: (context) => PostRepository()),
          RepositoryProvider<UserRepository>(
              create: (context) => UserRepository()),
          RepositoryProvider<AuthenticationRepository>(
              create: (context) => AuthenticationRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PostBloc>(
              create: (BuildContext context) => PostBloc(
                postRepository: RepositoryProvider.of<PostRepository>(context))
              ..add(PostsLoadEvent())),
            BlocProvider<TabBloc>(
              create: (BuildContext context) => TabBloc()
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
    bool passedOnboarding = false;
    return MaterialApp(
      title: 'Flutter train Twitter',
      initialRoute: !passedOnboarding ? AppRoutes.onboarding : AppRoutes.home,
      routes: {
        AppRoutes.onboarding: (context) => OnBoardingMain(),
        AppRoutes.home: (context) => HomeScreen()
      },
    );
  }
}
