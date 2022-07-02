import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors.dart';
import 'photo_model.dart';

class SecondRoute extends StatefulWidget {
  final PhotoModel image;

  static MaterialPageRoute route(PhotoModel photo) {
    return MaterialPageRoute(
      builder: (context) => SecondRoute(
        image: photo,
      ),
    );
  }

  const SecondRoute({Key? key, required this.image}) : super(key: key);

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  Widget textBuild(String string, String strong, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            string,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerRight,
              child: Text(
                strong,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 22,
          )
        ],
      ),
    );
  }

  Future<void> _makeUrl(String url) async {
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.second,
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          icon: Icon(Icons.chevron_left_sharp),
          iconSize: 32,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('ID: ' + widget.image.id),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 57, 0, 129),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              widget.image.url.full,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress != null) {
                  return Center(
                    child: Container(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        value: loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!,
                      ),
                      width: 40,
                      height: 40,
                    ),
                  );
                }
                return child;
              },
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                children: [
                  textBuild(
                    'Resolution',
                    '${widget.image.width}x${widget.image.height}',
                    Icons.wallpaper_rounded,
                  ),
                  textBuild(
                    'Likes',
                    '${widget.image.likes}',
                    Icons.favorite_outline,
                  ),
                  textBuild(
                    'Downloads',
                    '${widget.image.downloads}',
                    Icons.file_download_outlined,
                  ),
                  textBuild(
                    'Author',
                    '${widget.image.name}',
                    Icons.person_outline,
                  ),
                  textBuild(
                    'Author',
                    '${widget.image.name}',
                    Icons.person_outline,
                  ),
                  textBuild(
                    'Author',
                    '${widget.image.name}',
                    Icons.person_outline,
                  ),
                  textBuild(
                    'Author',
                    '${widget.image.name}',
                    Icons.person_outline,
                  ),
                  textBuild(
                    'Author',
                    '${widget.image.name}',
                    Icons.person_outline,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.purple;
                    }
                    return AppColors.primary;
                  },
                ),
              ),
              onPressed: () {
                _makeUrl(widget.image.url.full);
              },
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Download',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.file_download_outlined,
                      color: Colors.white,
                      size: 28,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
