import 'dart:math';

import 'package:dio/dio.dart';


class PixabayApi {
  final Dio _dio = Dio();
  final String _baseURL = 'https://pixabay.com/api/';
  final String _apiKey = '48337082-6ac0b6aa4bb4db2be7463424b';

  Future<List<dynamic>> fetchPhotos({
    required String imageSearch,
    required String imageType,
    required int amount
  }) async {

    try {
      final randomPage = Random().nextInt(100) + 1;
      Response response;
      do {
        response = await _dio.get(
          _baseURL,
          queryParameters: {
            'key': _apiKey,
            'q': imageSearch,
            'image_type': imageType,
            'per_page': amount,
          },
        );
        if (response.statusCode == 429 || response.statusCode == 400) {
          await Future.delayed(Duration(seconds: 5));
        }
      } while (response.statusCode == 429);

      if (response.statusCode == 200) {
        return response.data['hits'];
      }
      else {
        return Future.error('Error when loading photos!\n');
      }
    }

    catch (e) {
      return Future.error('Error when fetching photos!\n ${e.toString()}');
    }

  }
}