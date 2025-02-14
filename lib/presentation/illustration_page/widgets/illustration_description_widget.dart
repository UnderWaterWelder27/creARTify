import 'package:creartify/presentation/illustration_page/widgets/illustration_label_widget.dart';
import 'package:creartify/theme/colors.dart';
import 'package:creartify/theme/theme_app.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';




class IllustrationDescriptionWidget extends StatelessWidget {
  const IllustrationDescriptionWidget({
    super.key,
    required this.imageData
  });
  final dynamic imageData;


  String processPixabayUrl(String url) {
    url = url.replaceFirst(RegExp(r'https://pixabay\.com(/[^/]+)?/'), '');
    url = url.replaceFirst(RegExp(r'-\d+/'), '');
    url = url.replaceAll('-', ' ');

    if (url.isNotEmpty) {
      url = url[0].toUpperCase() + url.substring(1);
    }

    return url;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kIndentDefault * 1.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: kFabPositionPadding * 1.3),
          Center(
            child: IllustrationLabelWidget(
              style: ThemeApp.textTheme.titleSmall,
              icon: Icons.image_outlined,
              text: " ${processPixabayUrl(imageData['pageURL'])}",
            ),
          ),
          SizedBox(height: kIndentDefault * 1.7),
          IllustrationLabelWidget(
            style: ThemeApp.textTheme.labelSmall,
            icon: Icons.person_outline_rounded,
            text: " Author",
          ),
          Text(imageData['user'], style: ThemeApp.textTheme.labelMedium),

          SizedBox(height: kIndentDefault),
          IllustrationLabelWidget(
            style: ThemeApp.textTheme.labelSmall,
            icon: Icons.file_copy_outlined,
            text: " Type",
          ),
          Text(imageData['type'], style: ThemeApp.textTheme.labelMedium),

          SizedBox(height: kIndentDefault),
          IllustrationLabelWidget(
            style: ThemeApp.textTheme.labelSmall,
            icon: Icons.favorite_border_rounded,
            text: " Likes",
          ),
          Text(imageData['likes'].toString(), style: ThemeApp.textTheme.labelMedium),

          SizedBox(height: kIndentDefault),
          IllustrationLabelWidget(
            style: ThemeApp.textTheme.labelSmall,
            icon: Icons.download_outlined,
            text: " Downloads",
          ),
          Text(imageData['downloads'].toString(), style: ThemeApp.textTheme.labelMedium),

          SizedBox(height: kIndentDefault),
          IllustrationLabelWidget(
            style: ThemeApp.textTheme.labelSmall,
            icon: Icons.bookmarks_outlined,
            text: " Collections",
          ),
          Text(imageData['collections'].toString(), style: ThemeApp.textTheme.labelMedium),

          SizedBox(height: kIndentDefault),
          IllustrationLabelWidget(
            style: ThemeApp.textTheme.labelSmall,
            icon: Icons.tag_rounded,
            text: " Tags",
          ),
          Text(imageData['tags'], style: ThemeApp.textTheme.labelMedium?.copyWith(color: AppColors().inactiveDark)),
        ],
      ),
    );
  }
}
