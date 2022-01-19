import 'package:app/blocs/comment/comment_bloc.dart';
import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/blocs/tab/tab_bloc.dart';
import 'package:app/pages/home_screen.dart';
import 'package:app/pages/new_post.dart';
import 'package:app/pages/onboarding/onboarding/onboarding_main.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:app/repository/comment.dart';
import 'package:app/repository/image.dart';
import 'package:app/repository/post.dart';
import 'package:app/routes.dart';
import 'package:app/src/const.dart';
import 'package:app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/auth/auth_bloc.dart';

void main() {
  ImageRepository imageRepository = ImageRepository();
  AuthenticationRepository authRep = AuthenticationRepository(imageRepository);
  PostRepository postRepository = PostRepository(authRep, imageRepository);
  CommentRepository commentRepository = CommentRepository(postRepository, authRep);

  TabBloc tabBloc = TabBloc();
  PostBloc postBloc = PostBloc(postRepository: postRepository);
  CommentBloc commentBloc = CommentBloc(commentRepository, postBloc);
  AuthBloc authBloc = AuthBloc(authRep, tabBloc);

  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PostRepository>(
            create: (context) => postRepository),
        RepositoryProvider<AuthenticationRepository>(
            create: (context) => authRep),
        RepositoryProvider<CommentRepository>(
            create: (context) => commentRepository),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<PostBloc>(
            create: (BuildContext context) => postBloc..add(LoadPage(0))),
        BlocProvider<CommentBloc>(
            create: (BuildContext context) => commentBloc),
        BlocProvider<TabBloc>(create: (BuildContext context) => tabBloc),
        BlocProvider<AuthBloc>(
            create: (BuildContext context) => authBloc..add(CheckAuth()))
      ], child: App())));
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.data == null) {
          return const LoadingIndicator();
        }
        final passedOnBoarding = snapshot.data!.getBool(ONBOARDINGSTATUS);
        return MaterialApp(
          title: APPNAME,
          initialRoute: passedOnBoarding == null || passedOnBoarding == false
              ? AppRoutes.onboarding
              : AppRoutes.home,
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
