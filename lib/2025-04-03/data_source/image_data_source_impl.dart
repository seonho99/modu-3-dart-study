import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  final http.Client client;


  ImageDataSourceImpl({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<Uint8List> fetchImage(String url) async {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('이미지 다운로드 실패');
    }
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    final file = File(path);
    await file.writeAsBytes(bytes);
  }

  void dispose(){
    client.close();
  }
}
