import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';
import 'components/custom_text.dart';
import 'components/wrap_container.dart';
import 'helper/constants.dart';

enum Answers { yes, no }

class HeartDisease extends StatefulWidget {
  const HeartDisease({Key? key}) : super(key: key);

  @override
  State<HeartDisease> createState() => _HeartDiseaseState();
}

class _HeartDiseaseState extends State<HeartDisease> {

  final List<String> heartDiseaseQuestions = [
    'Fainting?',
    'Pain Due to Vascular Occlusion in Different Organs?',
    'Numbness in the Left Arm and Feeling of Pressure in the Chest?'
  ];
  late List<Answers?> _answersList;

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    for (var element in _answersList) {
      if (element == Answers.yes) {
        Diseases.heartDiseaseQuestions++;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();Diseases.heartDiseaseQuestions=0;
    _answersList = List.filled(3, Answers.no);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WrapContainer(
            child: CustomText(
              text: heartDiseaseQuestions[index],
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
                  groupValue: _answersList[index],
                  activeColor: context.accentColor(),
                  onChanged: (Answers? value) {
                    setState(() {
                      _answersList[index] = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<Answers>(
                  title: const Text('I do not have'),
                  value: Answers.no,
                  groupValue: _answersList[index],
                  activeColor: context.accentColor(),
                  onChanged: (Answers? value) {
                    setState(() {
                      _answersList[index] = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
