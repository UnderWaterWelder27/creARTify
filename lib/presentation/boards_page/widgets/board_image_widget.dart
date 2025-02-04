import 'package:creartify/presentation/widgets/app_image_loader_widget.dart';
import 'package:flutter/material.dart';


class BoardImageWidget extends StatelessWidget {
  const BoardImageWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return ApplicationImageLoaderWidget(imageURL: url);
  }
}
