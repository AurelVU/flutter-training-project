import 'package:flutter/cupertino.dart';
import 'package:onboarding/onboarding.dart';

class OnBoarding1 extends StatelessWidget
{
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 45.0),
            child: const Image(image: AssetImage('assets/images/facebook.png'),
                color: pageImageColor)),
        const SizedBox(
            width: double.infinity,
            child: Text('SECURED BACKUP', style: pageTitleStyle)),
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Keep your files in closed safe so you can\'t lose them',
            style: pageInfoStyle,
          ),
        ),
      ],
    );
  }
}