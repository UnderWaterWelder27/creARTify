import 'package:creartify/theme/colors.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class AppLoaderWidget extends StatelessWidget {
  const AppLoaderWidget({
    super.key,
    required this.size
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      color: globalColors.primaryBackground,
      secondRingColor: globalColors.activeLight,
      thirdRingColor: globalColors.activeDark,
      size: getScreenWidth(context) * size,
    );
  }
}
