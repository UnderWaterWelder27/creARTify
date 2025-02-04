import 'package:creartify/theme/colors.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';



class BoardEmptyCardWidget extends StatelessWidget {
  const BoardEmptyCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadiusDefault),
        color: globalColors.primaryForeground,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 5),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
          horizontal: kIndentDefault, vertical: kIndentSmall),
      width: double.maxFinite,
      height: getScreenHeight(context) * kLoaderLargeSize * 2,
      child: Center(
        child: Icon(
          Icons.cancel_presentation_rounded,
          color: globalColors.inactiveDark,
          size: 100,
        ),
      ),
    );
  }
}


// CALL WHEN
/*
return Column(
  children: [
    BoardCardWidget(
      previewImages: previewImages,
      categoryTitle: category,
    ),
    state is BoardsLoadedState && index == illustrations.keys.length - 1
    ? BoardEmptyCardWidget()
    : SizedBox.shrink(),
  ],
);
 */
