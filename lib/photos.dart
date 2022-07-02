import 'package:flutter/material.dart';
import 'package:unsplash/colors.dart';
import 'http_service.dart';
import 'photo_model.dart';
import 'photo_element.dart';

class PhotosPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.second,
      appBar: AppBar(
        title: Text("Gallery"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 57, 0, 129),
      ),
      body: FutureBuilder(
        future: httpService.getPhotos(),
        builder: (BuildContext contex, AsyncSnapshot<List<PhotoModel>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<PhotoModel> photos = snapshot.data!;
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 22,
              padding: EdgeInsets.all(22),
              children: photos
                  .map(
                    (PhotoModel photo) => PhotoElement(photoModel: photo),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
