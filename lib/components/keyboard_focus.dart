import 'package:flutter/material.dart';

//Klavye açıldığında kapatmak için boş yere tıklanabilir.
//TextField ve TextFormField widget'ların  evebeynini bu widget ile sarmala.

class KeyboardFocus extends StatelessWidget {
  final Widget child;

  const KeyboardFocus({Key? key, required this.child}) : super(key: key);

  factory KeyboardFocus.unFocus({required Widget child}) =>
      KeyboardFocus(child: child);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: child,
    );
  }
}
