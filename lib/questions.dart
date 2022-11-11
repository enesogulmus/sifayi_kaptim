import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sifayi_kaptim/helper/constants.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';
import 'package:sifayi_kaptim/generated/assets.dart';

class Questions extends StatefulWidget {

  const Questions(
      {Key? key,
      })
      : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  //hastalıklar
  late int diabetes;
  late int hypertension;
  late int obesity;
  late int cancer;
  late int cholesterol;
  late int calcification;
  late int herniatedDisc;
  late int ulcer;
  late int heartDisease;
  late int lungDisease;

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); //hastaliklar
    diabetes = Diseases.diabetes;
    hypertension = Diseases.hypertension;
    obesity = Diseases.obesity;
    cancer = Diseases.cancer;
    cholesterol = Diseases.cholesterol;
    calcification = Diseases.calcification;
    herniatedDisc = Diseases.herniatedDisc;
    ulcer = Diseases.ulcer;
    heartDisease = Diseases.heartDisease;
    lungDisease = Diseases.lungDisease;
  }

  @override
  Widget build(BuildContext context) {
    int? a=0;
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackGroundColor,
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 60,
            ),
            child: SvgPicture.asset(Assets.svgNeyimvarLogo),
          ),
          ListTile(
            title: const Text('Increased Urine Frequency'),
            textColor: context.primaryTextColor(),
            leading: Radio<int>(
              fillColor: MaterialStateColor.resolveWith(
                  (states) => context.primaryTextColor()),
              value: a,
              groupValue: 1,
              onChanged: (int? value) {
                setState(() {
                    a=value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
