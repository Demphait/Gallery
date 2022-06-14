import 'package:flutter/material.dart';
import 'package:unsplash/colors.dart';
import 'photo_model.dart';
import 'package:unsplash/second_route.dart';

class PhotoElement extends StatelessWidget {
  final PhotoModel photoModel;

  const PhotoElement({
    Key? key,
    required this.photoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(10, 10),
            ),
          ]
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Flexible(
                    child: Image.network(
                      photoModel.url.thumb,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(11),
                    width: double.infinity,
                    color: AppColors.primary,
                    alignment: Alignment.center,
                    child: Text(
                      photoModel.id,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.push(context, SecondRoute.route(photoModel)),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
