import 'package:artist_icon/screens/feed/CommentScreen.dart';
import 'package:artist_icon/screens/feed/model/Data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:artist_icon/screens/feed/SharePost.dart';

import '../Color.dart';

class FeedListItem  extends StatelessWidget {
      const FeedListItem({
      this.character,
      Key key,
      }) : super(key: key);

      final Data character;

@override
Widget build(BuildContext context) => ListTile(
  title: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {

                },
                child: new Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg"
                        )
                    ),
                  ),
                ),
              ),
              new SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {

                    },
                    child: new Text(
                      character.user_name,
                      style: TextStyle(fontWeight: FontWeight.bold,),
                    ),
                  ),

                ],
              )
            ],
          ),
          //SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 52),
            child: Text('09-11-2020',style: TextStyle(fontSize: 12),),
          ),
          new IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: null,
          )
        ],
      ),
    ),
    Text('Indian Social Chat free chat room service. Meet and chat withover the world. Use this free Chat...'),
    CachedNetworkImage(
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg",
      placeholder: ((context, s) => Center(
        child: CircularProgressIndicator(),
      )),
      width: 125.0,
      height: 250.0,
      fit: BoxFit.cover,
    ),
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                  child: character.is_like==1
                      ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                      : Icon(
                    FontAwesomeIcons.heart,
                    color: null,
                  ),
                  onTap: () {
                    print('Pressed');
                  }),
              new SizedBox(
                width: 16.0,
              ),
              GestureDetector(
                onTap: () {
                  print("Comment pressed");
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>CommentScreen()));
                },
                child: new Icon(
                  FontAwesomeIcons.comment,
                ),
              ),
              new SizedBox(
                width: 16.0,
              ),
              InkWell(
                onTap: (){
                  print("Share click here");
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>SharePost()));
                },
                  child: new Icon(FontAwesomeIcons.shareAlt)),
            ],
          ),
          new Icon(FontAwesomeIcons.bookmark)
        ],
      ),
    ),
    Row(
      children: [
        Text('451 likes')
      ],
    ),
    Row(
      children: [
        Text("Livin’ that neon life! ",style: TextStyle(fontSize: 11),),
        Text('View comments',style: TextStyle(color: Color(fountColor),fontSize: 15),)
      ],
    )
  ],
  ),
);
}