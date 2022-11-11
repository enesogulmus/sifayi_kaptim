import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sifayi_kaptim/components/custom_text.dart';
import 'package:sifayi_kaptim/components/wrap_container.dart';
import 'package:sifayi_kaptim/generated/assets.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(Assets.animationsFirst),
          CustomText(
            text:
                'It is an application that tries to predict the diagnosis of people according to their complaints and directs them to the most appropriate branch. Do not use in an emergency.',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            textColor: context.primaryTextColor(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
