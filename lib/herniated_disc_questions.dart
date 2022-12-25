import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';
import 'components/custom_text.dart';
import 'components/wrap_container.dart';
import 'helper/constants.dart';

enum Answers { yes, no }

class HerniatedDisc extends StatefulWidget {
  const HerniatedDisc({Key? key}) : super(key: key);

  @override
  State<HerniatedDisc> createState() => _HerniatedDiscState();
}

class _HerniatedDiscState extends State<HerniatedDisc> {
  final List<String> herniatedDiscQuestions = [
    'Pain Radiating from the Waist to the Legs?',
    'Pain Increases with Prolonged Standing?',
    'Reduction of Pain When Lying on the Back?'
  ];
  late List<Answers?> _answersList;

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    for (var element in _answersList) {
      if (element == Answers.yes) {
        Diseases.herniatedDiscQuestions++;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Diseases.herniatedDiscQuestions = 0;
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
              text: herniatedDiscQuestions[index],
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
