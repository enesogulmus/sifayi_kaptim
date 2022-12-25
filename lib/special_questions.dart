import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/calcification_questions.dart';
import 'package:sifayi_kaptim/cholesterol_questions.dart';
import 'package:sifayi_kaptim/diabetes_questions.dart';
import 'package:sifayi_kaptim/heart_disease_questions.dart';
import 'package:sifayi_kaptim/helper/constants.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';
import 'package:sifayi_kaptim/herniated_disc_questions.dart';
import 'package:sifayi_kaptim/lung_disease_questions.dart';
import 'package:sifayi_kaptim/ulcer_questions.dart';

import 'cancer_questions.dart';
import 'components/create_route.dart';
import 'components/custom_button.dart';
import 'components/custom_text.dart';
import 'components/smooth_page_indicator.dart';
import 'components/swap_effect.dart';
import 'generated/assets.dart';
import 'hypertension_questions.dart';
import 'results.dart';

class SpecialQuestions extends StatefulWidget {
  const SpecialQuestions({Key? key}) : super(key: key);

  @override
  State<SpecialQuestions> createState() => _SpecialQuestionsState();
}

class _SpecialQuestionsState extends State<SpecialQuestions> {
  final PageController controller = PageController();
  late int pageCount, activeIndex;
  late bool onLastPage;
  bool showDiabetes = false,
      showHypertension = false,
      showCancer = false,
      showCholesterol = false,
      showCalcification = false,
      showHerniatedDisc = false,
      showUlcer = false,
      showHeartDisease = false,
      showLungDisease = false;

  @override
  void initState() {
    pageCount = 0;
    activeIndex = 0;
    super.initState();
    howManyPage();
    onLastPage = (pageCount == 1);
    isShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackGroundColor(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 60,
            ),
            child: Image.asset(
              Assets.svgLogo,
              height: 78,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: 'Şifayı Kaptım',
            fontSize: 28,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            textColor: context.accentColor(),
          ),
          const SizedBox(
            height: 60,
          ),
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      activeIndex = index;
                      onLastPage = (index == pageCount - 1);
                    });
                  },
                  children: <Widget>[
                    if (showDiabetes) const Diabetes(),
                    if (showHypertension) const Hypertension(),
                    if (showCancer) const Cancer(),
                    if (showCholesterol) const Cholesterol(),
                    if (showCalcification) const Calcification(),
                    if (showHerniatedDisc) const HerniatedDisc(),
                    if (showUlcer) const Ulcer(),
                    if (showHeartDisease) const HeartDisease(),
                    if (showLungDisease) const LungDisease(),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
                  child: RotatedBox(
                    quarterTurns: 0,
                    child: AnimatedSmoothIndicator(
                      count: pageCount,
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
                        text: 'Show your advice',
                        color: context.accentColor(),
                        textColor: context.primaryColor(),
                        action: () {
                          Navigator.of(context).pushReplacement(
                            createRoute(
                              routePage: const Results(),
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
          )
        ],
      ),
    );
  }

  void howManyPage() {
    pageCount = (Diseases.diabetesTotal / 2 <= Diseases.diabetes) ? pageCount + 1 : pageCount;
    pageCount = (Diseases.hypertensionTotal / 2 <= Diseases.hypertension) ? pageCount + 1 : pageCount;
    pageCount = (Diseases.cancerTotal / 2 <= Diseases.cancer) ? pageCount + 1 : pageCount;
    pageCount = (Diseases.cholesterolTotal / 2 <= Diseases.cholesterol) ? pageCount + 1 : pageCount;
    pageCount = (Diseases.calcificationTotal / 2 <= Diseases.calcification) ? pageCount + 1 : pageCount;
    pageCount = (Diseases.herniatedDiscTotal / 2 <= Diseases.herniatedDisc) ? pageCount + 1 : pageCount;
    pageCount = (Diseases.ulcerTotal / 2 <= Diseases.ulcer) ? pageCount + 1 : pageCount;
    pageCount = (Diseases.heartDiseaseTotal / 2 <= Diseases.heartDisease) ? pageCount + 1 : pageCount;
    pageCount = (Diseases.lungDiseaseTotal / 2 <= Diseases.lungDisease) ? pageCount + 1 : pageCount;
  }

  void isShow() {
    showDiabetes = Diseases.diabetesTotal / 2 <= Diseases.diabetes;
    showHypertension = Diseases.hypertensionTotal / 2 <= Diseases.hypertension;
    showCancer = Diseases.cancerTotal / 2 <= Diseases.cancer;
    showCholesterol = Diseases.cholesterolTotal / 2 <= Diseases.cholesterol;
    showCalcification = Diseases.calcificationTotal / 2 <= Diseases.calcification;
    showHerniatedDisc = Diseases.herniatedDiscTotal / 2 <= Diseases.herniatedDisc;
    showUlcer = Diseases.ulcerTotal / 2 <= Diseases.ulcer;
    showHeartDisease = Diseases.heartDiseaseTotal / 2 <= Diseases.heartDisease;
    showLungDisease = Diseases.lungDiseaseTotal / 2 <= Diseases.lungDisease;
  }
}
