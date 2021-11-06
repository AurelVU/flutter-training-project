import 'package:app/blocs/post/post_bloc.dart';
import 'package:app/pages/feed.dart';
import 'package:app/pages/navigation.dart';
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
          return MultiBlocProvider(
            providers: [
              BlocProvider<PostBloc>(
                  create: (BuildContext context) => PostBloc(postRepository: PostRepository())..add(PostsLoadEvent())
              )
            ],
            child: MultiRepositoryProvider(
              providers: [
                RepositoryProvider<PostRepository>(
                  create: (context) => PostRepository()
                )
              ],
              child: const Feed()
            )//
            // child: Onboarding(
            //   background: Colors.white70,
            //   proceedButtonStyle: ProceedButtonStyle(
            //     proceedButtonBorderRadius: BorderRadius.circular(100),
            //     proceedButtonColor: Colors.blueAccent,
            //     proceedpButtonText: const Text('Начать'),
            //     proceedButtonRoute: (context) {
            //       return Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Navigation(),
            //         ),
            //         (route) => false,
            //       );
            //     },
            //   ),
            //   isSkippable: false,
            //   pages: onBoardingPagesList,
            //   indicator: Indicator(
            //     indicatorDesign: IndicatorDesign.line(
            //       lineDesign: LineDesign(
            //         lineType: DesignType.line_nonuniform,
            //       ),
            //     ),
            //   ),
            // ),
          );
        }
      },
    );
  }
}
