import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final bool? isUnderlined;
  final Color? textColor;
  final TextAlign? textAlign;

  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.textColor,
    this.isUnderlined,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.w700,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,// ?? context.primaryTextColor(),
        decoration: isUnderlined == true ? TextDecoration.underline : null,
      ),
    );
  }
}