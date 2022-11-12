import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sifayi_kaptim/generated/assets.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final bool hasMargin;

  const CustomCheckBox({
    Key? key,
    required this.isChecked,
    required this.hasMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      margin: hasMargin
          ? const EdgeInsets.only(
              left: 20,
              bottom: 15,
              top: 15,
              right: 9,
            )
          : const EdgeInsets.all(0),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.transparent,
        border: Border.all(
          color: context.primaryTextColor(),
        ),
      ),
      child: isChecked
          ? SvgPicture.asset(
              Assets.svgIconChecked,
        color: context.accentColor(),
            )
          : null,
    );
  }
}
