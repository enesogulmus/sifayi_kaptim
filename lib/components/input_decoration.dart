import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';

InputDecoration customInputDecoration(
  BuildContext context, {
  String? iconPath,
  String? suffixIconPath,
  required String hintText,
  bool? passive = false,
}) {
  return InputDecoration(
    border: InputBorder.none,
    prefixIcon: (iconPath != '' && iconPath != null)
        ? Container(
            margin: const EdgeInsets.only(
              right: 5,
              top: 25,
              bottom: 0,
              left: 15,
            ),
            child: SvgPicture.asset(
              iconPath,
              color: context.accentColor(),
              height: 24.0,
              width: 24.0,
            ),
          )
        : Container(
            width: 15,
          ),
    prefixIconConstraints: BoxConstraints(
      minHeight: (iconPath != '' && iconPath != null) ? 32 : 15,
      minWidth: (iconPath != '' && iconPath != null) ? 32 : 15,
    ),
    suffixIcon: (suffixIconPath != '' && suffixIconPath != null)
        ? SvgPicture.asset(
            suffixIconPath,
          )
        : const SizedBox(),
    hintText: hintText,
    contentPadding: const EdgeInsets.fromLTRB(45, 30, 0, 0),
    errorStyle: const TextStyle(
      fontFamily: 'Nunito',
    ),
    hintStyle: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: context.passiveTextColor(),
    ),
  );
}
