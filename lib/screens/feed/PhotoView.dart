import 'package:flutter/material.dart';
class PhotoView1 extends StatefulWidget {
  final image;
  const PhotoView1({this.image,Key key}) : super(key: key);

  @override
  _PhotoView1State createState() => _PhotoView1State();
}

class _PhotoView1State extends State<PhotoView1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage(
                "${widget.image??''}"
            ),

          ),
        ),
      ),
    );
  }
}
