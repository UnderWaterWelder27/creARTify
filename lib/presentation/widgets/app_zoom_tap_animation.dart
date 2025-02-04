import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';



class AppZoomTapAnimation extends StatelessWidget {
  const AppZoomTapAnimation({
    super.key,
    required this.child
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1.0,
      end: 1.4,
      beginDuration: const Duration(milliseconds: 40),
      endDuration: const Duration(milliseconds: 290),
      child: child
    );
  }
}
