import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/helper/constants.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';
import 'components/custom_text.dart';
import 'components/wrap_container.dart';

enum Answers { yes, no }

class Diabetes extends StatefulWidget {
  const Diabetes({Key? key}) : super(key: key);

  @override
  State<Diabetes> createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
  final List<String> diabetesQuestions = ['Intense Feeling of Hunger?', 'Infection Tendency?', 'Excessive Thirst?'];
  late List<Answers?> _answersList;

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    for (var element in _answersList) {
      if (element == Answers.yes) {
        Diseases.diabetesQuestions++;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Diseases.diabetesQuestions = 0;
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
              text: diabetesQuestions[index],
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
