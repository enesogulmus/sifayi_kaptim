import 'package:flutter/material.dart';
import 'package:sifayi_kaptim/helper/extensions.dart';

class WrapTextFormField extends StatelessWidget {
  final Widget child;
  final double? verticalMargin;
  final double? horizontalMargin;

  const WrapTextFormField({Key? key, required this.child, this.verticalMargin, this.horizontalMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: verticalMargin ?? 5, horizontal: horizontalMargin ?? 20),
      decoration: BoxDecoration(
          color: context.primaryColor(),
          borderRadius: BorderRadius.circular(10),
          //boxShadow: Constants.straightPopupShadow,
      ),
      child: child,
    );
  }
}
