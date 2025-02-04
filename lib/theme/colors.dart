import 'package:flutter/material.dart';



abstract class AppColor {
  const AppColor({
    required this.primaryForeground,
    required this.primaryBackground,
    required this.inactiveLight,
    required this.inactiveDark,
    required this.textBlack,
    required this.activeLight,
    required this.activeDark,
  });

  final Color primaryForeground;
  final Color primaryBackground;
  final Color inactiveLight;
  final Color inactiveDark;
  final Color textBlack;
  final Color activeLight;
  final Color activeDark;
}



class AppColors implements AppColor {
  @override
  Color get primaryForeground => const Color(0xffffffff);

  @override
  Color get primaryBackground => const Color(0xffe5e5e5);

  @override
  Color get inactiveLight => const Color(0xffbebebe);

  @override
  Color get inactiveDark => const Color(0xff989898);

  @override
  Color get textBlack => const Color(0xff000000);

  @override
  Color get activeLight => const Color(0xffFFAC5F);

  @override
  Color get activeDark => const Color(0xffFF4D3C);
}


