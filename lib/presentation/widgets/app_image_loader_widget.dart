import 'package:creartify/presentation/widgets/app_loader_widget.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';


class ApplicationImageLoaderWidget extends StatelessWidget {
  const ApplicationImageLoaderWidget({
    super.key,
    required this.imageURL,

  });
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageURL,
      fit: BoxFit.cover,

      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Container(
          color: Colors.white,
          child: Center(
            child: AppLoaderWidget(size: kLoaderSmallSize),
          ),
        );
      },

      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, color: Colors.grey),
        );
      },

    );
  }
}
