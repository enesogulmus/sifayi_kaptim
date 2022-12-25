import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';
import 'components/custom_text.dart';
import 'components/wrap_container.dart';
import 'helper/constants.dart';

enum Answers { yes, no }

class Calcification extends StatefulWidget {
  const Calcification({Key? key}) : super(key: key);

  @override
  State<Calcification> createState() => _CalcificationState();
}

class _CalcificationState extends State<Calcification> {
  final List<String> calcificationQuestions = [
    'Sound from the Joints (Crepitation)?',
    'Loss of Flexibility?',
    'Tendency to Close When the Joint is Immobilized for a Long Time?'
  ];
  late List<Answers?> _answersList;

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    for (var element in _answersList) {
      if (element == Answers.yes) {
        Diseases.calcificationQuestions++;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Diseases.calcificationQuestions =0;
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
              text: calcificationQuestions[index],
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
