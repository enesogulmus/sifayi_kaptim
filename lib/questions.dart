import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/components/custom_button.dart';
import 'package:sifayi_kaptim/components/custom_text.dart';
import 'package:sifayi_kaptim/components/wrap_container.dart';
import 'package:sifayi_kaptim/generated/assets.dart';
import 'package:sifayi_kaptim/helper/constants.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(
              child: CustomText(
                text: label,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                textColor: context.primaryTextColor(),
              ),
            ),
            Checkbox(
              activeColor: context.accentColor(),
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Questions extends StatefulWidget {
  const Questions({
    Key? key,
  }) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  late List<bool> _isSelectedList;
  List<String> dataOfGeneralSympthoms = [
    '1.	Increased Urine Frequency',
    '2.	Sudden Weight Loss',
    '3.	Blurred Vision',
    '4.	Skin Problems',
    '5.	Fatigue and Weakness',
    '6.	Headache',
    '7.	Dizziness',
    '8.	Shortness',
    '9.	Palpitation',
    '10.	Chest Pain',
    '11.	High Fever',
    '12.	Strong Pains',
    '13.	Cough',
    '14.	Sweating',
    '15.	Bleeding in the Mouth',
    '16.	Numbness',
    '17.	Bruising',
    '18.	Pale Skin',
    '19.	Wen',
    '20.	Diseases.obesity',
    '21.	Sensibility',
    '22.	Joint Pain',
    '23.	Stifness',
    '24.	Humpback',
    '25.	Weakness in Hands',
    '26.	Increased Pain with Movement',
    '27.	Burning Pain',
    '28.	Difficulty Moving',
    '29.	Backache',
    '30.	Poor Posture',
    '31.	Stomache Ache',
    '32.	Nauseation',
    '33.	Bloating and Stomach Gas',
    '34.	Dyspepsia',
    '35.	Inability to Eat',
    '36.	Unconsciousness',
    '37.	Sudden Weight Gain',
    '38.	Heart Muscle Burning',
    '39.	Exuivation',
    '40.	Inactivity',
    '41.	Difficulty Breathing',
    '42.	Hemopthysis',
    '43.	Wheezing',
    '44.	Feeling of Heaviness When Clicking on the Chest',
    '45.	Difficulty Swallowing'
  ];
  late List<int> selectedIndexes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isSelectedList = List.filled(45, false);
    selectedIndexes = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackGroundColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 60,
            ),
            child: Image.asset(
              Assets.svgLogo,
              height: 78,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 45,
              shrinkWrap: true,
              separatorBuilder: (context, index) => WrapContainer(
                child: Divider(
                  color: context.generalColor(),
                  thickness: 1.0,
                ),
              ),
              itemBuilder: (context, index) => LabeledCheckbox(
                label: dataOfGeneralSympthoms[index],
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                value: _isSelectedList[index],
                onChanged: (bool newValue) {
                  selectedIndexes.add(index);
                  setState(() {
                    _isSelectedList[index] = newValue;
                  });
                },
              ),
            ),
          ),
          Button(
            color: CustomColors.accentColor,
            textColor: CustomColors.primaryColor,
            text: 'Neyim Var',
            hasBorder: false,
            action: () {
              calculationOfGeneralPosibility();
            },
          ),
        ],
      ),
    );
  }

  void calculationOfGeneralPosibility() {
    for (var element in selectedIndexes) {
      switch (selectedIndexes[element]) {
        case 0:
          Diseases.diabetes++;
          Diseases.cancer++;
          Diseases.hypertension++;
          break;
        case 1:
          Diseases.diabetes++;
          Diseases.cancer++;
          Diseases.ulcer++;
          break;
        case 2:
          Diseases.diabetes++;
          Diseases.hypertension++;
          break;
        case 3:
          Diseases.diabetes++;
          Diseases.cancer++;
          Diseases.hypertension++;
          Diseases.cholesterol++;
          Diseases.calcification++;
          Diseases.heartDisease++;
          break;
        case 4:
          Diseases.diabetes++;
          Diseases.cancer++;
          Diseases.hypertension++;
          Diseases.cholesterol++;
          Diseases.calcification++;
          Diseases.heartDisease++;
          Diseases.herniatedDisc++;
          break;
        case 5:
          Diseases.heartDisease++;
          Diseases.hypertension++;
          break;
        case 6:
          Diseases.calcification++;
          Diseases.hypertension++;
          break;
        case 7:
          Diseases.lungDisease++;
          Diseases.cancer++;
          Diseases.hypertension++;
          break;
        case 8:
          Diseases.heartDisease++;
          Diseases.hypertension++;
          break;
        case 9:
          Diseases.cholesterol++;
          Diseases.lungDisease++;
          Diseases.hypertension++;
          Diseases.heartDisease++;
          break;
        case 10:
          Diseases.calcification++;
          Diseases.cancer++;
          Diseases.heartDisease++;
          break;
        case 11:
          Diseases.calcification++;
          Diseases.cancer++;
          Diseases.herniatedDisc++;
          Diseases.ulcer++;
          Diseases.lungDisease++;
          Diseases.heartDisease++;
          break;
        case 12:
          Diseases.lungDisease++;
          Diseases.cancer++;
          Diseases.heartDisease++;
          break;
        case 13:
          Diseases.cancer++;
          Diseases.lungDisease++;
          break;
        case 14:
          Diseases.cancer++;
          break;
        case 15:
          Diseases.calcification++;
          Diseases.cholesterol++;
          Diseases.herniatedDisc++;
          break;
        case 16:
          Diseases.cholesterol++;
          Diseases.heartDisease++;
          Diseases.lungDisease++;
          break;
        case 17:
          Diseases.cholesterol++;
          Diseases.cancer++;
          Diseases.heartDisease++;
          break;
        case 18:
          Diseases.cholesterol++;
          break;
        case 19:
          Diseases.cholesterol++;
          Diseases.diabetes++;
          Diseases.hypertension++;
          Diseases.herniatedDisc++;
          Diseases.calcification++;
          Diseases.heartDisease++;
          break;
        case 20:
          Diseases.calcification++;
          break;
        case 21:
          Diseases.calcification++;
          Diseases.herniatedDisc++;
          break;
        case 22:
          Diseases.calcification++;
          break;
        case 23:
          Diseases.calcification++;
          break;
        case 24:
          Diseases.heartDisease++;
          Diseases.calcification++;
          break;
        case 25:
          Diseases.calcification++;
          Diseases.herniatedDisc++;
          break;
        case 26:
          Diseases.heartDisease++;
          Diseases.herniatedDisc++;
          Diseases.ulcer++;
          break;
        case 27:
          Diseases.herniatedDisc++;
          Diseases.calcification++;
          break;
        case 28:
          Diseases.herniatedDisc++;
          Diseases.calcification++;
          Diseases.heartDisease++;
          break;
        case 29:
          Diseases.calcification++;
          Diseases.herniatedDisc++;
          break;
        case 30:
          Diseases.ulcer++;
          break;
        case 31:
          Diseases.ulcer++;
          Diseases.heartDisease++;
          break;
        case 32:
          Diseases.ulcer++;
          break;
        case 33:
          Diseases.ulcer++;
          break;
        case 34:
          Diseases.ulcer++;
          Diseases.cancer++;
          Diseases.heartDisease++;
          break;
        case 35:
          Diseases.heartDisease++;
          break;
        case 36:
          Diseases.heartDisease++;
          break;
        case 37:
          Diseases.heartDisease++;
          break;
        case 38:
          Diseases.heartDisease++;
          break;
        case 39:
          Diseases.heartDisease++;
          Diseases.lungDisease++;
          Diseases.calcification++;
          Diseases.herniatedDisc++;
          Diseases.hypertension++;
          break;
        case 40:
          Diseases.lungDisease++;
          break;
        case 41:
          Diseases.lungDisease++;
          Diseases.cancer++;
          break;
        case 42:
          Diseases.lungDisease++;
          break;
        case 43:
          Diseases.lungDisease++;
          break;
        case 44:
          Diseases.lungDisease++;
          break;
      }
    }
    debugPrint('lung: ${Diseases.lungDisease}');
    debugPrint('hyper: ${Diseases.hypertension}');
    debugPrint('herniated: ${Diseases.herniatedDisc}');
    debugPrint('calcification: ${Diseases.calcification}');
    debugPrint('heart: ${Diseases.heartDisease}');
    debugPrint('ulcer: ${Diseases.ulcer}');
    debugPrint('diabetes: ${Diseases.diabetes}');
    debugPrint('cholosterol: ${Diseases.cholesterol}');
    debugPrint('cancer: ${Diseases.cancer}');
    debugPrint('obesity: ${Diseases.obesity}');
  }
}
