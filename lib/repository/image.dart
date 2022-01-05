import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class ImageRepository {
  Future<String?> sendImage(String path) async {
    var url = Uri.https('api.kraken.io', '/v1/upload');
    var request = MultipartRequest("POST", url);
    request.fields['data'] =
        '{"auth": {"api_key": "391b0ad923ff586503cfe863c3e9246f", "api_secret": "4a46c848b427a425f7a356e35318b6946d0b5971"}, "wait":true}';
    request.files.add(await MultipartFile.fromPath('upload', path,
        contentType: MediaType('image', 'jpeg')));
    var response = await request.send();

    if (response.statusCode == 200) {
      return json.decode(await response.stream.bytesToString())['kraked_url'];
    } else {
      return null;
    }
  }
}
