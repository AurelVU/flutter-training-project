import 'package:app/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes.dart';
import 'on_boarding1.dart';
import 'on_boarding2.dart';
import 'on_boarding3.dart';

class OnBoardingMain extends StatelessWidget {
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

  OnBoardingMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.data == null)
            return LoadingIndicator();
          else {
            snapshot.data!.setBool('passedOnboarding', true);
            return Onboarding(
              proceedButtonStyle: ProceedButtonStyle(
                proceedpButtonText: Text('Общаться!'),
                  proceedButtonColor: Color.fromRGBO(0x04, 0x5C, 0xC3, 1),
                proceedButtonRoute: (context) {
                  return Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.home,
                    (route) => false,
                  );
                },
              ),
              isSkippable: true,
              pages: onBoardingPagesList,
              pagesContentPadding: EdgeInsets.zero,
              titleAndInfoPadding: EdgeInsets.zero,
              indicator: Indicator(
                indicatorDesign: IndicatorDesign.line(
                  lineDesign: LineDesign(
                    lineType: DesignType.line_uniform,
                  ),
                ),
              ),
              //-------------Other properties--------------
              background: Color.fromRGBO(0xDA, 0xDA, 0xDA, 1),
              //EdgeInsets pagesContentPadding
              //EdgeInsets titleAndInfoPadding
              //EdgeInsets footerPadding
              //SkipButtonStyle skipButtonStyle
            );
          }
        });
  }
}
