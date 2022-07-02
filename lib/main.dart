import 'package:flutter/material.dart';
import 'photos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PhotosPage(),
    );
  }
}







































// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:unsplash/http_service.dart';
// import 'package:unsplash/photo_model.dart';

// //import 'package:unsplash/entities/picture.dart';
// //import 'dart:html';
// // import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Unsplash',
//       theme: ThemeData(
//         primarySwatch: Colors.green, 
//       ),
//       home: MyHomePage(title: 'Unsplash App'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   // List<Picture> _pictures = List<Picture>();

//   // Future<List<Picture>> fetchImage() async {
//   //   var url = 'https://api.unsplash.com/photos/?client_id=nqxrE5-xFCBxRPQtij4x1bqh7445CA6ooZ435cA3wHc';
//   //   var response = await http.get(url);

//   //   var pictures = List<Picture>();

//   //   if (response.statusCode == 200) {
//   //   var picturesJson = json.decode(response.body);
//   //   for (var pictureJson in picturesJson){
//   //     pictures.add(Picture.fromJson(pictureJson));
//   //     }
//   //   }
//   //   return pictures;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // fetchImage().then((value) {
//     //   setState((){
//     //   _pictures.addAll(value);
//     //   });
//     // });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       //  body: ListView.builder(
//       //    itemBuilder: (context, index){
//       //      return Card(
//       //        child: Column(
//       //          children: <Widget>[
//       //            Text('Some Title'),
//       //            Text('Some Text'),
//       //         ],
//       //       ),
//       //      );
//       //     },
//       //     itemCount: 20,
//       //     physics: BouncingScrollPhysics(),
//       //    ),
//     );
//   }
// }
