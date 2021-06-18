import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
class PhotoView1 extends StatefulWidget {
  final image;
  final imagetype;
  const PhotoView1({this.imagetype,this.image,Key key}) : super(key: key);

  @override
  _PhotoView1State createState() => _PhotoView1State();
}

class _PhotoView1State extends State<PhotoView1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget.imagetype=="1"?Container(
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
      ):Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: BetterPlayer.network("${widget.image??''}",
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 1,
            looping: true,
            autoPlay: true,
            fit: BoxFit.cover,

          ),),

      ),
    );
  }
}
