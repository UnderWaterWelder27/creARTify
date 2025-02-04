import 'package:creartify/network/pixabay_api.dart';
import 'package:creartify/presentation/gallery_page/bloc/gallery_event.dart';
import 'package:creartify/presentation/gallery_page/bloc/gallery_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// *****************************************************************************
// GALLERY BLOC
// - represent infinite view of illustrations
// *****************************************************************************

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final PixabayApi api;
  final List<dynamic> _photos = [];
  final int _retryAttempts = 3;
  final int _retryDelay = 5;

  GalleryBloc(this.api) : super(GalleryInitialState()) {
    on<GalleryFetchPhotosEvent>(_onGalleryFetchPhotos);
    on<GalleryDisposeEvent>(_onGalleryDisposeEvent);
  }

  void _onGalleryDisposeEvent(GalleryDisposeEvent event, Emitter<GalleryState> emit) {
    _photos.clear();
    emit(GalleryDisposeState());
  }

  Future<void> _onGalleryFetchPhotos(GalleryFetchPhotosEvent event, Emitter<GalleryState> emit) async {
    int attempts = 0;
    while (attempts < _retryAttempts) {
      try {

        if (attempts > 0) {
          await Future.delayed(Duration(seconds: _retryDelay));
        }

        if (state is! GalleryLoadingState) {
          emit(GalleryLoadingState());
        }

        final loadedPhotos = await api.fetchPhotos(
            imageSearch: event.search,
            imageType: event.type,
            amount: event.amount);

        final uniquePhotos = loadedPhotos.where((photo) {
          return !_photos.any((existingPhoto) => existingPhoto['id'] == photo['id']);
        }).toList();

        _photos.addAll(uniquePhotos);
        emit(GalleryLoadedState(photos: List.from(_photos)));
        return;
      }
      catch (e) {
        attempts++;
        if (attempts >= _retryAttempts) {
          emit(GalleryErrorState(errorMessage: e.toString()));
          break;
        }
      }
    }

    // Emit the last loaded state (preserve already loaded images)
    if (_photos.isNotEmpty) {
      emit(GalleryLoadedState(photos: List.from(_photos)));
    }
  }
}