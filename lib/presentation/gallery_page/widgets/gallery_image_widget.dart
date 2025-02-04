import 'package:creartify/presentation/widgets/app_image_loader_widget.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

// *****************************************************************************
// [CLASS] G A L E R Y   I M A G E   W I D G E T
// *****************************************************************************
class GalleryImageWidget extends StatelessWidget {
  const GalleryImageWidget({
    super.key,
    required this.width,
    required this.height,
    required this.url
  });

  final double width;
  final double height;
  final String url;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusDefault),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kRadiusDefault),
          child: ApplicationImageLoaderWidget(imageURL: url),
        ),
      ),
    );
  }
}
