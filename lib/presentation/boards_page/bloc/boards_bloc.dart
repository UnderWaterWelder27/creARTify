import 'package:creartify/network/pixabay_api.dart';
import 'package:creartify/presentation/boards_page/bloc/boards_event.dart';
import 'package:creartify/presentation/boards_page/bloc/boards_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardsBloc extends Bloc<BoardsEvent, BoardsState> {
  final PixabayApi api;
  BoardsBloc(this.api) : super(BoardsInitialState()) {
    on<BoardsFetchMultipleCategoriesEvent>(_onBoardsFetchMultiplePhotos);
  }

  Future<void> _onBoardsFetchMultiplePhotos(
      BoardsFetchMultipleCategoriesEvent event,
      Emitter<BoardsState> emit) async {

    emit(BoardsLoadingState());
    try {
      final Map<String, List<dynamic>> results = {};
      for (String query in event.searchQueries) {
        final photos = await api.fetchPhotos(
            imageSearch: query,
            imageType: event.type,
            amount: event.amount
        );
        results[query] = photos;

        emit(BoardsPartialLoadedState(
          categorizedPhotos: Map.from(results),
          lastLoadedCategory: query,
        ));
      }

      emit(BoardsLoadedState(categorizedPhotos: results));
    }
    catch (e) {
      emit(BoardsErrorState(errorMessage: e.toString()));
    }
  }

}