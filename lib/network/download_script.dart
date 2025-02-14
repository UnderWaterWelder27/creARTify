import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';




class ImageDownloader {
  final Dio _dio = Dio();


  Future<bool> _requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }


  Future<Directory?> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return await getExternalStorageDirectory();
    }
    else if (Platform.isIOS) {
      return await getApplicationDocumentsDirectory();
    }
    return null;
  }


  Future<void> downloadFile(String url) async {
    String fileName = url.split('/').last;

    if (await _requestPermission()) {
      final Directory? directory = await _getDownloadDirectory();

      if (directory != null) {
        final String filePath = '${directory.path}/$fileName';
        final File file = File(filePath);

        try {
          Response response = await _dio.download(
            url,
            file.path,
            onReceiveProgress: (received, total) {
              if (total != -1) {
                print(
                  'Downloading: ${(received / total * 100).toStringAsFixed(0)}%',
                );
              }
            },
          );
          if (response.statusCode == 200) {
            print('File downloaded to: $filePath');
          } else {
            print('Failed to download file: ${response.statusCode}');
          }
        } catch (e) {
          print('Download failed: $e');
        }
      } else {
        print('Unable to get directory for file saving.');
      }
    } else {
      print('Storage permission not granted.');
    }
  }
}