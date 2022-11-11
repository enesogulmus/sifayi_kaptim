import 'package:flutter/material.dart';

Route createRoute({required Widget routePage}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 550),
    pageBuilder: (context, animation, secondaryAnimation) => routePage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

extension RestartPageEffect on Widget {
  Future? restartPageFade({required BuildContext context}) => Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (BuildContext context, _, __) {
        return this;
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
  );
}