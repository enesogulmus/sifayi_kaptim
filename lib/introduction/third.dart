import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sifayi_kaptim/components/custom_text.dart';
import 'package:sifayi_kaptim/components/wrap_container.dart';
import 'package:sifayi_kaptim/generated/assets.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';

class Third extends StatelessWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.animationsThird,
          ),
          CustomText(
            text: 'In line with all the answers received from you, we will make the necessary calculations and direct you to the polyclinics with the most accurate result.',
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
