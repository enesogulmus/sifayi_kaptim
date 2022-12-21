import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/components/wrap_container.dart';
import 'package:sifayi_kaptim/helper/constants.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';

import 'components/create_route.dart';
import 'components/custom_button.dart';
import 'components/custom_text.dart';
import 'components/smooth_page_indicator.dart';
import 'components/swap_effect.dart';
import 'generated/assets.dart';
import 'results.dart';

enum Answers { yes, no }

class SpecialQuestions extends StatefulWidget {
  const SpecialQuestions({Key? key}) : super(key: key);

  @override
  State<SpecialQuestions> createState() => _SpecialQuestionsState();
}

class _SpecialQuestionsState extends State<SpecialQuestions> {
  final PageController controller = PageController();
  final List<String> diabetesQuestions = ['Intense Feeling of Hunger?', 'Infection Tendency?', 'Excessive Thirst?'];
  final List<String> hypertensionQuestions = ['Intense Feeling of Hunger?', 'Infection Tendency?', 'Excessive Thirst?'];
  final List<String> cancerQuestions = ['Intense Feeling of Hunger?', 'Infection Tendency?', 'Excessive Thirst?'];
  final List<String> cholesterolQuestions = ['Intense Feeling of Hunger?', 'Infection Tendency?', 'Excessive Thirst?'];
  final List<String> calcificationQuestions = ['Intense Feeling of Hunger?', 'Infection Tendency?', 'Excessive Thirst?'];
  final List<String> herniatedDiscQuestions = ['Intense Feeling of Hunger?', 'Infection Tendency?', 'Excessive Thirst?'];
  final List<String> ulcerQuestions = [
    'Intense Feeling of Hunger?',
    'Infection Tendency?',
    'Consuming Too Much Coffee, Salt, Fat, and Sugar?'
  ];
  final List<String> heartDiseaseQuestions = [
    'Fainting?',
    'Pain Due to Vascular Occlusion in Different Organs?',
    'Numbness in the Left Arm and Feeling of Pressure in the Chest?'
  ];
  final List<String> lungDiseaseQuestions = [
    'Frequent Respiratory Infections?',
    'Swelling in the Ankles, Feet, or Legs?',
    'Frequently Inhaling Dust Elements such as Cement, Coal, Asbestos, Ammonia etc.?'
  ];
  Answers? _answers = Answers.no;
  bool onLastPage = false;
  late int howManyPage;

  @override
  Widget build(BuildContext context) {
    howManyPage = 0;
    int activeIndex = 0;
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
                      onLastPage = (index == howManyPage);
                    });
                  },
                  children: <Widget>[
                    Visibility(
                      visible: isVisible('diabetes'),
                      child: buildQuestions(context, diabetesQuestions),
                    ),
                    Visibility(
                      visible: isVisible('hypertension'),
                      child: buildQuestions(context, hypertensionQuestions),
                    ),
                    Visibility(
                      visible: isVisible('cancer'),
                      child: buildQuestions(context, cancerQuestions),
                    ),
                    Visibility(
                      visible: isVisible('cholesterol'),
                      child: buildQuestions(context, cholesterolQuestions),
                    ),
                    Visibility(
                      visible: isVisible('calcification'),
                      child: buildQuestions(context, calcificationQuestions),
                    ),
                    Visibility(
                      visible: isVisible('herniatedDisc'),
                      child: buildQuestions(context, herniatedDiscQuestions),
                    ),
                    Visibility(
                      visible: isVisible('ulcer'),
                      child: buildQuestions(context, ulcerQuestions),
                    ),
                    Visibility(
                      visible: isVisible('heartDisease'),
                      child: buildQuestions(context, heartDiseaseQuestions),
                    ),
                    Visibility(
                      visible: isVisible('lungDisease'),
                      child: buildQuestions(context, lungDiseaseQuestions),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
                  child: RotatedBox(
                    quarterTurns: 0,
                    child: AnimatedSmoothIndicator(
                      count: howManyPage,
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

  Widget buildQuestions(BuildContext context, List<String> questionList) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WrapContainer(
            child: CustomText(
              text: questionList[index],
              fontSize: 16,
              textAlign: TextAlign.left,
              textColor: context.primaryTextColor(),
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<Answers>(
                  title: const Text('I have'),
                  value: Answers.yes,
                  groupValue: _answers,
                  activeColor: context.accentColor(),
                  onChanged: (Answers? value) {
                    setState(() {
                      _answers = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<Answers>(
                  title: const Text('I do not have'),
                  value: Answers.no,
                  groupValue: _answers,
                  activeColor: context.accentColor(),
                  onChanged: (Answers? value) {
                    setState(() {
                      _answers = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  bool isVisible(String illness) {
    bool result = false;
    switch (illness) {
      case 'diabetes':
        result = Diseases.diabetesTotal / 2 <= Diseases.diabetes;
        break;
      case 'hypertension':
        result = Diseases.hypertensionTotal / 2 <= Diseases.hypertension;
        break;
      case 'cancer':
        result = Diseases.cancerTotal / 2 <= Diseases.cancer;
        break;
      case 'cholesterol':
        result = Diseases.cholesterolTotal / 2 <= Diseases.cholesterol;
        break;
      case 'calcification':
        result = Diseases.calcificationTotal / 2 <= Diseases.calcification;
        break;
      case 'herniatedDisc':
        result = Diseases.herniatedDiscTotal / 2 <= Diseases.herniatedDisc;
        break;
      case 'ulcer':
        result = Diseases.ulcerTotal / 2 <= Diseases.ulcer;
        break;
      case 'heartDisease':
        result = Diseases.heartDiseaseTotal / 2 <= Diseases.heartDisease;
        break;
      case 'lungDisease':
        result = Diseases.lungDiseaseTotal / 2 <= Diseases.lungDisease;
        break;
      default:
        result = false;
    }
    if (result) {
      howManyPage++;
    }
    return result;
  }
}
