import 'package:app/presentation/feed.dart';
import 'package:app/presentation/on_boarding1.dart';
import 'package:app/presentation/on_boarding2.dart';
import 'package:app/presentation/on_boarding3.dart';
import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter train Twitter',
      home: Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
          proceedpButtonText: const Text('Начать'),
          proceedButtonRoute: (context) {
            return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Feed(),
              ),
                  (route) => false,
            );
          },
        ),
        isSkippable: false,
        pages: onBoardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.line(
            lineDesign: LineDesign(
              lineType: DesignType.line_nonuniform,
            ),
          ),
        ),
      ),
    );
  }
}
