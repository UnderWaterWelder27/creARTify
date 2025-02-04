// FLUTTER BASIC
import 'package:creartify/presentation/boards_page/widgets/board_empty_card_widget.dart';
import 'package:creartify/presentation/widgets/app_loader_widget.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// BOARDS BLOC
import 'package:creartify/presentation/boards_page/bloc/boards_bloc.dart';
import 'package:creartify/presentation/boards_page/bloc/boards_event.dart';
import 'package:creartify/presentation/boards_page/bloc/boards_state.dart';
// WIDGETS
import 'package:creartify/presentation/widgets/app_header_widget.dart';
import 'package:creartify/presentation/boards_page/widgets/board_card_widget.dart';



class BoardsView extends StatefulWidget {
  const BoardsView({super.key});
  @override
  State<BoardsView> createState() => _BoardsViewState();
}



// *****************************************************************************
// [CLASS] B O A R D S   V I E W
// *****************************************************************************
class _BoardsViewState extends State<BoardsView> {

  @override
  void initState() {
    super.initState();
    final List<String> searchQueries = [
      'anime', 'sunset', 'mountain', 'ocean', 'forest',
      'cityscape', 'abstract', 'wildlife', 'desert', 'galaxy',
      'rain', 'snow', 'spring', 'autumn', 'summer',
      'winter', 'night', 'day', 'urban', 'rural'
    ];
    context.read<BoardsBloc>().add(
      BoardsFetchMultipleCategoriesEvent(
        searchQueries: searchQueries,
        type: 'illustration',
        amount: 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Expanded(
            flex: 4,
            child: ApplicationHeaderWidget(
              title: 'Boards',
              description: 'Following galleries to power up your art career',
            ),
          ),

          Expanded(
            flex: 13,
            child: BlocBuilder<BoardsBloc, BoardsState>(
              builder: (context, state) {

                if (state is BoardsInitialState || state is BoardsLoadingState) {
                  return Center(child: AppLoaderWidget(size: kLoaderLargeSize));
                }

                if (state is BoardsErrorState) {
                  return Center(child: AppLoaderWidget(size: kLoaderLargeSize));
                }

                if (state is BoardsPartialLoadedState || state is BoardsLoadedState) {
                  final illustrations = state is BoardsPartialLoadedState
                      ? state.categorizedPhotos
                      : (state as BoardsLoadedState).categorizedPhotos;

                  return ListView.builder(
                    padding: EdgeInsets.only(top: kIndentSmall, bottom: kBottomAppBarHeight + kIndentSmallDouble),
                    itemCount: illustrations.keys.length,
                    itemBuilder: (context, index) {
                      final category = illustrations.keys.elementAt(index);
                      final previewImages = illustrations[category];
                      return BoardCardWidget(
                        previewImages: previewImages,
                        categoryTitle: category,
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
