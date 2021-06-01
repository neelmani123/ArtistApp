import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CommentScreen extends StatefulWidget {
  const CommentScreen({Key key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Comments"),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 550,
        child: ListView.builder(
          itemCount: 10,
            itemBuilder: (BuildContext,index)
            {
              return Column(
                children: [
                  Row(
                   // mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      new Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
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
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("oceantheme_org",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 80),
                          child: Icon(Icons.favorite_border)),

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      children: [
                        Text('7m'),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('1 like'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('Reply'),
                        )
                      ],
                    ),
                  )

                ],
              );
        }),
      )
    );
  }
}
