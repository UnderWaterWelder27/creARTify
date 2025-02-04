import 'package:creartify/presentation/boards_page/widgets/board_icon_widget.dart';
import 'package:creartify/presentation/boards_page/widgets/board_image_widget.dart';
import 'package:creartify/presentation/boards_page/widgets/board_title_widget.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';


class BoardCardWidget extends StatelessWidget {
  const BoardCardWidget({
    super.key,
    required this.previewImages,
    required this.categoryTitle,
  });

  final List<dynamic>? previewImages;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadiusDefault),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 5),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: kIndentDefault, vertical: kIndentSmall*2),
      width: double.maxFinite,
      height: getScreenHeight(context)*0.26,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //----------------------------
              // LEFT SIDE - one large image
              Expanded(
                child: SizedBox(
                  width: getScreenWidth(context)*0.5,
                  height: getScreenHeight(context)*0.20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(kRadiusDefault)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: kIndentLittle),
                      child: BoardImageWidget(url: previewImages![0]['webformatURL']),
                    ),
                  ),
                ),
              ),
              //------------------------------
              // RIGHT SIDE - two small images
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // top image
                    SizedBox(
                      width: getScreenWidth(context)*0.5,
                      height: getScreenHeight(context)*0.10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(kRadiusDefault)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: kIndentLittle),
                          child: BoardImageWidget(url: previewImages![1]['webformatURL']),
                        ),
                      ),
                    ),
                    // bottom image
                    SizedBox(
                      width: getScreenWidth(context)*0.5,
                      height: getScreenHeight(context)*0.10,
                      child: BoardImageWidget(url: previewImages![2]['webformatURL']),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //----------------------------
          // BOTTOM TEXT - text & button
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kIndentDefault),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoardTittleWidget(inputText: categoryTitle),
                  BoardIconWidget(queryToSend: categoryTitle,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
