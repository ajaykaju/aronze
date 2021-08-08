import 'package:flutter/material.dart';

class SlideFromBottomRoute extends PageRouteBuilder {
  final Widget page;
  SlideFromBottomRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondAnimation) => page,
    transitionsBuilder: (context, animation, secondAnimation, child) {
      const curve = Curves.easeInOut;
      var tween = Tween<Offset>(
        begin: Offset(0, 1),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}