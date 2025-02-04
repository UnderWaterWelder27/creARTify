abstract class BoardsState {}


class BoardsInitialState extends BoardsState {}


class BoardsLoadingState extends BoardsState {}


class BoardsPartialLoadedState extends BoardsState {
  BoardsPartialLoadedState({
    required this.categorizedPhotos,
    required this.lastLoadedCategory,
  });
  final Map<String, List<dynamic>> categorizedPhotos;
  final String lastLoadedCategory;
}


class BoardsLoadedState extends BoardsState {
  BoardsLoadedState({required this.categorizedPhotos});
  final Map<String, List<dynamic>> categorizedPhotos;
}

class BoardsErrorState extends BoardsState {
  BoardsErrorState({required this.errorMessage});
  final String errorMessage;
}