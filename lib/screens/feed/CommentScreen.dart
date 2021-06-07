import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class CommentScreen extends StatefulWidget {
  final Map<dynamic,dynamic> data;
  const CommentScreen({this.data,Key key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController comment_controller=new TextEditingController();
  Future doComment()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'),"post_id":widget.data['id'],"comments":comment_controller.text});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Feed_api/do_comment",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    if(status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: data['message']);
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Comments"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 510,
              child: ListView.builder(
                itemCount: widget.data['comment_data'].length,
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
                              width: 200,
                              height:60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                /*boxShadow: [
                                  BoxShadow(color: Color(0xFFF5F5F5), spreadRadius: 3),
                                ],*/
                                color: Color(0xFFF5F5F5)
                              ),
                              padding: EdgeInsets.only(left: 10,top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.data['comment_data'][index]['name']??'',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(widget.data['comment_data'][index]['comments']??'',style: TextStyle(color: Colors.black),),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 90),
                          child: Row(
                            children: [
                              Text('7m'),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('${widget.data['like_count']??''} like'),
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
            ),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Divider(color: Colors.grey,),
                Container(
                  width: 260,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                     hintText: '  Write a comment...'
                    ),
                    controller: comment_controller,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: ()
                  {
                    doComment();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10,right: 20),
                    child: Icon(Icons.send,size: 20,),
                  ),
                )
              ],
            ),
        ],
      )
    );
  }
}
