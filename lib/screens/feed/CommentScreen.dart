import 'dart:convert';

import 'package:artist_icon/screens/feed/model/getAllPost/feed/CommentData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class CommentScreen extends StatefulWidget {
   final List<CommentData> comment_data;
   final String id;
  const CommentScreen({this.id,this.comment_data,Key key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController comment_controller=new TextEditingController();

  Future doComment()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'),"post_id":widget.id,"comments":comment_controller.text});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Feed_api/do_comment",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    if(status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: data['message']);
        widget.comment_data;
        comment_controller.clear();
      });
    }

  }
 /* Future getAllPost()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'),"pages":"1"});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Feed_api/get_all_post",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    print('Status is:${status}');
    if(status==true)
    {
      setState(() {
        allData=data['data'];
        for(int i=0;i<=allData.length;i++)
          {
           setState(() {
             data2=allData[i]['comment_data'];
             print("Comment Data is :${data2}");
             _isLoading=false;
           });

          }
      });

    }
  }*/
 @override
  void initState() {
    // TODO: implement initState
//   getAllPost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text("Comments",style: TextStyle(fontFamily: 'RobotoSlab'),),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 510,
                child: ListView.builder(
                    itemCount: widget.comment_data.length,
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
                                          "${widget.comment_data[index].profile_image??''}"
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
                                    SizedBox(height: 3,),
                                    Text("${widget.comment_data[index].name ?? ''}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'RobotoSlab'),),
                                   // SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text("${widget.comment_data[index].comments ?? ''}",style: TextStyle(color: Colors.black,fontFamily: 'RobotoSlab'),),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,)
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