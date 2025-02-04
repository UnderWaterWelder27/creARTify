import 'package:creartify/theme/theme_app.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';
import 'package:gradient_icon/gradient_icon.dart';



class IllustrationIconWidget extends StatelessWidget {
  const IllustrationIconWidget({
    super.key,
    required this.icon,
    this.size = 22,
  });
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GradientIcon(
      offset: Offset(0, 1.0),
      icon: icon,
      gradient: ThemeApp.gradientColors(globalColors.activeLight, globalColors.activeDark),
      size: size,
    );
  }
}
/*
return Padding(
  padding: EdgeInsets.only(bottom: kIndentSmall * 1.3),
  child: GradientIcon(
    icon: icon,
    gradient: ThemeApp.gradientColors(globalColors.activeLight, globalColors.activeDark),
    size: 25,
  ),
);
*/