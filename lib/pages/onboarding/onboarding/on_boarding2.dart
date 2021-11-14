import 'package:flutter/cupertino.dart';
import 'package:onboarding/onboarding.dart';

class OnBoarding2 extends StatelessWidget
{
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/twitter.png', color: pageImageColor),
        const Text('CHANGE AND RISE', style: pageTitleStyle),
        const Text(
          'Give others access to any file or folder you choose',
          style: pageInfoStyle,
        )
      ],
    );
  }
}