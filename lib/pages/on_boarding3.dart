import 'package:flutter/cupertino.dart';
import 'package:onboarding/onboarding.dart';

class OnBoarding3 extends StatelessWidget
{
  const OnBoarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/instagram.png', color: pageImageColor),
        const Text('EASY ACCESS', style: pageTitleStyle),
        const Text(
          'Reach your files anytime from any devices anywhere',
          style: pageInfoStyle,
        ),
      ],
    );
  }
}