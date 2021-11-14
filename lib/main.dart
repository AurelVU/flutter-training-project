import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/blocs/tab/tab_bloc.dart';
import 'package:app/pages/hose_screen.dart';
import 'package:app/pages/on_boarding1.dart';
import 'package:app/pages/on_boarding2.dart';
import 'package:app/pages/on_boarding3.dart';
import 'package:app/repository/post.dart';
import 'package:app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/onboarding.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final onBoardingPagesList = [
    PageModel(
      widget: const OnBoarding1(),
    ),
    PageModel(
      widget: const OnBoarding2(),
    ),
    PageModel(
      widget: const OnBoarding3(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter train Twitter',
      routes: {
        ArchSampleRoutes.home: (context) {
          return MultiRepositoryProvider(
              providers: [
                RepositoryProvider<PostRepository>(
                  create: (context) => PostRepository()
                )
              ],
              child: MultiBlocProvider(
                  providers: [
                    BlocProvider<PostBloc>(
                        create: (BuildContext context) => PostBloc(
                            postRepository: RepositoryProvider.of<PostRepository>(context))..add(PostsLoadEvent())
                    ),
                    BlocProvider<TabBloc>(
                        create: (BuildContext context) => TabBloc()
                    )
                  ],
                  child: HomeScreen()
            )
          );
        }
      },
    );
  }
}
