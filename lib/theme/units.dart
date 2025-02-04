import 'package:creartify/theme/colors.dart';
import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;

final AppColors globalColors = AppColors();


// RADIUS
const double kRadiusDefault = 15.0;
const double kRadiusLarge = 35.0;
const double kRadiusXLarge = 55.0;

// MARGINS & PADDINGS
const double kIndentLittle = 3.0;
const double kIndentSmall = 5.0;
const double kIndentSmallDouble = 10.0;
const double kIndentDefault = 25.0;
const double kNotchMargin = 8.0;

// ILLUSTRATION VIEW
const double kInitialDraggableSheetSize = 0.09;
const double kMaximumDraggableSheetSize = 0.75;
const double kFabPositionPadding = 35;

// SIZES
const double kBottomAppBarHeight = 85;
const double kLoaderSmallSize = 0.07;
const double kLoaderLargeSize = 0.20;
const double kIconSmall = 35;
const double kIconLarge = 60;