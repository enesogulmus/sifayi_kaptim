import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:sifayi_kaptim/components/wrap_container.dart';
import 'package:sifayi_kaptim/helper/constants.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';

import 'components/custom_button.dart';
import 'components/custom_text.dart';
import 'generated/assets.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  late String diseases;
  late String departments;
  final List<int> questionsList = [
    Diseases.diabetesQuestions,
    Diseases.hypertensionQuestions,
    Diseases.cancerQuestions,
    Diseases.cholesterolQuestions,
    Diseases.calcificationQuestions,
    Diseases.herniatedDiscQuestions,
    Diseases.ulcerQuestions,
    Diseases.heartDiseaseQuestions,
    Diseases.lungDiseaseQuestions
  ];
  late List<String> zero;
  late List<String> one;
  late List<String> two;
  late List<String> three;

  void whichIsDepartment(List<String> diseases) {
    for (var element in diseases) {
      switch (element) {
        case 'Diabetes':
          departments = 'endocrinology';
          break;
        case 'Hypertension':
          departments = 'internal medicine';
          break;
        case 'Cancer':
          departments = '	oncology';
          break;
        case 'Cholesterol':
          departments = 'internal medicine';
          break;
        case 'Calcification':
          departments = 'cardiology';
          break;
        case 'Herniated Disc':
          departments = 'neurosurgery';
          break;
        case 'Ulcer':
          departments = 'gastroenterology';
          break;
        case 'Heart Disease':
          departments = 'cardiology';
          break;
        case 'Lung Disease':
          departments = 'pulmonology';
          break;
      }
    }
  }

  String whereDisease(int i) {
    switch (i) {
      case 0:
        return 'Diabetes';
      case 1:
        return 'Hypertension';
      case 2:
        return 'Cancer';
      case 3:
        return 'Cholesterol';
      case 4:
        return 'Calcification';
      case 5:
        return 'Herniated Disc';
      case 6:
        return 'Ulcer';
      case 7:
        return 'Heart Disease';
      case 8:
        return 'Lung Disease';
      default:
        return 'determined';
    }
  }

  void init() {
    for (int i = 0; i < 9; i++) {
      switch (questionsList[i]) {
        case 0:
          zero.add(whereDisease(i));
          break;
        case 1:
          one.add(whereDisease(i));
          break;
        case 2:
          two.add(whereDisease(i));
          break;
        case 3:
          three.add(whereDisease(i));
          break;
      }
    }
    if (three.isNotEmpty) {
      diseases = three.toString();
      whichIsDepartment(three);
    } else if (two.isNotEmpty) {
      diseases = '$diseases, ${two.toString()}';
      whichIsDepartment(two);
    } else if (one.isNotEmpty) {
      diseases = '$diseases, ${one.toString()}';
      whichIsDepartment(one);
    } else if (zero.isNotEmpty) {
      diseases = 'Not Determined';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    zero = [];
    one = [];
    two = [];
    three = [];
    diseases = '';
    departments = '';
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackGroundColor(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                top: 60,
              ),
              child: Image.asset(
                Assets.svgLogo,
                height: 78,
              ),
            ),
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
          WrapContainer(
            child: CustomText(
              text:
                  'According to the symptoms you give, you may have $diseases. Please note that this application does not give you a definite result and is for informational purposes only.  In this direction, please apply to the $departments of the nearest hospital.  We wish you to stay healthy.',
              fontSize: 18,
              textColor: context.primaryTextColor(),
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                text: 'Restart App',
                color: context.accentColor(),
                textColor: context.primaryColor(),
                action: () {
                  Restart.restartApp();
                },
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
