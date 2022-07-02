import 'dart:convert';
import 'package:http/http.dart';
import 'package:unsplash/photo_model.dart';

class HttpService {
  final String photosURL =
      "https://api.unsplash.com/photos/random?count=30&client_id=nqxrE5-xFCBxRPQtij4x1bqh7445CA6ooZ435cA3wHc";

  Future<List<PhotoModel>> getPhotos() async {
    Response res = await get(photosURL);

    if (res.statusCode == 200) {
      List<dynamic> photosMap = jsonDecode(res.body);

      List<PhotoModel> photos =
          photosMap.map((e) => PhotoModel.fromMap(e)).toList();

      return photos;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
