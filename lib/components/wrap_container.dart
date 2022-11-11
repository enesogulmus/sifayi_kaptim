import 'package:flutter/material.dart';

class WrapContainer extends StatelessWidget {
  final Widget child;

  const WrapContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: child,
    );
  }
}
