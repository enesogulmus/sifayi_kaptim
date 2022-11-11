import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/components/create_route.dart';
import 'package:sifayi_kaptim/components/custom_button.dart';
import 'package:sifayi_kaptim/components/smooth_page_indicator.dart';
import 'package:sifayi_kaptim/components/swap_effect.dart';
import 'package:sifayi_kaptim/db/intro_shown.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';
import 'package:sifayi_kaptim/introduction/first.dart';
import 'package:sifayi_kaptim/introduction/second.dart';
import 'package:sifayi_kaptim/introduction/third.dart';
import 'package:sifayi_kaptim/personal_information.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  bool onLastPage = false;
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      backgroundColor: context.scaffoldBackGroundColor(),
      body: Stack(
        children: [
          PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                activeIndex = index;
                onLastPage = (index == 2);
              });
            },
            children: const <Widget>[
              First(),
              Second(),
              Third(),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: RotatedBox(
              quarterTurns: 0,
              child: AnimatedSmoothIndicator(
                count: 3,
                activeIndex: activeIndex,
                effect: SwapEffect(
                  activeDotColor: context.accentColor(),
                  dotColor: context.generalColor(),
                ),
              ),
            ),
          ),
          Visibility(
            visible: onLastPage,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  text: 'Anladım',
                  color: context.accentColor(),
                  textColor: context.primaryColor(),
                  action: () {
                    IntroShown().setIntroScreen();
                    Navigator.of(context).pushReplacement(
                      createRoute(
                        routePage: const PersonalInformation(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
