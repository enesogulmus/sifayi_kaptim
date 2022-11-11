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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.animationsThird,
          ),
          CustomText(
            text: 'buraya uygulamanın işyelişi ile ilgili bir metin gelecek',
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
