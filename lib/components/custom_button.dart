
import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/components/create_route.dart';
import 'package:sifayi_kaptim/components/custom_text.dart';
import 'package:sifayi_kaptim/helper/constants.dart';

class Button extends StatelessWidget {
  final Widget? page;
  final String text;
  final Color color;
  final Color? textColor;
  final bool? hasBorder;
  final Function()? action;
  final double? noMargin;
  final bool? isBottomRadius;

  const Button({
    Key? key,
    required this.text,
    required this.color,
    this.page,
    this.textColor,
    this.hasBorder,
    this.action,
    this.noMargin,
    this.isBottomRadius = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action ??
          () {
            Navigator.of(context).push(
              createRoute(
                routePage: page!,
              ),
            );
          },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(
          horizontal: noMargin ?? 20,
          vertical: noMargin ?? 5,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: hasBorder == true
              ? Border.all(
                  color: textColor!,
                  width: 1.0,
                )
              : null,
          color: color,
          borderRadius: isBottomRadius!
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))
              : CustomDecorations.borderRadiusGeometry,
          boxShadow: CustomDecorations.buttonShadowList,
        ),
        child: CustomText(
          textColor: textColor,
          text: text,
          fontSize: 18,
        ),
      ),
    );
  }
}
