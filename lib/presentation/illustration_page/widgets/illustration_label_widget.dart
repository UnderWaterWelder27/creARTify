import 'package:creartify/presentation/illustration_page/widgets/illustration_icon_widget.dart';
import 'package:flutter/material.dart';




class IllustrationLabelWidget extends StatelessWidget {
  const IllustrationLabelWidget({
    super.key,
    required this.style,
    required this.icon,
    required this.text
  });
  final TextStyle? style;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: style,
      TextSpan(
        children: [
          WidgetSpan(child: IllustrationIconWidget(icon: icon)),
          TextSpan(text: text),
        ],
      ),
    );
  }
}
