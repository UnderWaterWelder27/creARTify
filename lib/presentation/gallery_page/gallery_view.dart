// FLUTTER BASIC
import 'dart:math';
import 'package:creartify/presentation/illustration_page/illustration_view.dart';
import 'package:creartify/presentation/gallery_page/widgets/gallery_image_widget.dart';
import 'package:creartify/presentation/widgets/app_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// GALLERY BLOC
import 'package:creartify/presentation/gallery_page/bloc/gallery_bloc.dart';
import 'package:creartify/presentation/gallery_page/bloc/gallery_event.dart';
import 'package:creartify/presentation/gallery_page/bloc/gallery_state.dart';
// WIDGETS
import 'package:creartify/presentation/widgets/app_header_widget.dart';
// CONSTANTS
import 'package:creartify/theme/units.dart';
// PACKAGES
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class GalleryView extends StatefulWidget {
  const GalleryView({ super.key });
  static String categorizedQuery = '';
  @override
  State<GalleryView> createState() => _GalleryViewState();
}



// *****************************************************************************
// [CLASS] G A L E R Y   V I E W
// *****************************************************************************
class _GalleryViewState extends State<GalleryView> {
  int _page = 1;
  final int _pageSize = 10;
  final ScrollController _scrollController = ScrollController();
  final Map<int, double> _imageHeights = {};
  bool isImageClicked = false;

  void _loadPhotos() {
    context.read<GalleryBloc>().add(
      GalleryFetchPhotosEvent(
        search: GalleryView.categorizedQuery,
        type: 'illustration',
        amount: _page * _pageSize,
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - kBottomAppBarHeight) {
      _page++;
      _loadPhotos();
    }
  }

  double _getImageHeight(int index) {
    if (!_imageHeights.containsKey(index)) {
      _imageHeights[index] = (Random().nextInt(4) * 60 + 120).toDouble();
    }
    return _imageHeights[index]!;
  }

  @override
  void didChangeDependencies() {
    context.read<GalleryBloc>().add(GalleryDisposeEvent());
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _loadPhotos();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double imageWidth = getScreenWidth(context) / 2 - kIndentSmall * 2.5;
    double crossAxisCount = getScreenWidth(context) / (imageWidth);

    return Column(
      children: [

        Expanded(
          flex: 4,
          child: ApplicationHeaderWidget(
            title: 'Illustrations',
            description: 'CURATED GALLERIES',
          ),
        ),

        Expanded(
          flex: 13,
          child: BlocBuilder<GalleryBloc, GalleryState>(
            buildWhen: (previous, current) {
              return current is GalleryLoadedState ||
                     current is GalleryErrorState ||
                     current is GalleryLoadingState && _page == 1;
            },

            builder: (context, state) {
              if (state is GalleryInitialState || state is GalleryLoadingState && _page == 1) {
                return Center(child: AppLoaderWidget(size: kLoaderLargeSize));
              }

              if (state is GalleryErrorState) {
                return Center(child: AppLoaderWidget(size: kLoaderLargeSize));
              }

              else if (state is GalleryLoadedState) {
                final illustrations = state.photos;
                return Padding(
                  padding: const EdgeInsets.only(right: kIndentSmall, left: kIndentSmall, bottom: kIndentSmall),
                  child: MasonryGridView.count(
                    padding: EdgeInsets.only(top: kIndentSmallDouble, bottom: kBottomAppBarHeight + kIndentSmallDouble),
                    controller: _scrollController,
                    itemCount: illustrations.length,
                    mainAxisSpacing: kIndentSmall * 1.5,
                    crossAxisCount: crossAxisCount.toInt(),

                    itemBuilder: (context, index) {
                      final webFormatUrl = illustrations[index]['webformatURL'] ?? '';
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                IllustrationView.illustrationWidth = getScreenWidth(context);
                                IllustrationView.illustrationHeight = getScreenHeight(context) * kInitialDraggableSheetSize;
                                return IllustrationView(imageData: illustrations[index]);
                              },
                            ),
                          );
                        },
                        child: GalleryImageWidget(
                          width: imageWidth,
                          height: _getImageHeight(index),
                          url: webFormatUrl,
                        ),
                      );
                    },

                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
