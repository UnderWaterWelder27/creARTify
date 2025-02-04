abstract class GalleryEvent {}


class GalleryFetchPhotosEvent extends GalleryEvent {
  GalleryFetchPhotosEvent({
    required this.search,
    required this.type,
    required this.amount});

  final String search;
  final String type;
  final int amount;
}


class GalleryDisposeEvent extends GalleryEvent {}