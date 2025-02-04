abstract class GalleryState {}


class GalleryInitialState extends GalleryState {}


class GalleryLoadingState extends GalleryState {}


class GalleryLoadedState extends GalleryState {
  GalleryLoadedState({required this.photos});
  final List<dynamic> photos;
}


class GalleryDisposeState extends GalleryState {}


class GalleryErrorState extends GalleryState {
  GalleryErrorState({required this.errorMessage});
  final String errorMessage;
}