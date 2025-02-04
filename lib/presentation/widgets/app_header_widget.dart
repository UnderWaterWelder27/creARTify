import 'package:creartify/theme/theme_app.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';
import 'package:gradient_icon/gradient_icon.dart';


class ApplicationHeaderWidget extends StatelessWidget {
  const ApplicationHeaderWidget({
    super.key,
    required this.title,
    required this.description
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: kIndentDefault, vertical: kIndentSmallDouble),
      width: double.infinity,
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => {},
              highlightColor: globalColors.activeLight.withOpacity(0.07),
              icon: Container(
                padding: EdgeInsets.only(bottom: kIndentSmall * 2.9),
                child: GradientIcon(
                  icon: Icons.arrow_back_ios,
                  gradient: ThemeApp.gradientColors(globalColors.activeLight, globalColors.activeDark),
                  size: kIconSmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kIndentSmall),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'TTNorms',
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Color(0xff464646),
                ),
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontFamily: 'TTNorms',
                fontSize: 15,
                color: Color(0xffa9a9a9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
