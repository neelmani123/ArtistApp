import 'dart:convert';

import 'package:artist_icon/model/MyFeedModel/MyFeedData.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/feed/CommentScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class MyFeed extends StatefulWidget {
  const MyFeed({Key key}) : super(key: key);

  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {
  bool _isLoading=true;
  List<Data> data1;
  HttpService _httpService = HttpService();
  _getMyFeed()async{
    var res=await _httpService.myFeed();
    if(res.status==true)
      {
        setState(() {
          data1=res.data;
          Fluttertoast.showToast(msg: res.message);
          _isLoading=false;
        });
      }
  }
  _doLike(String id)async{
    var res=await _httpService.doLike(id: id);
    if(res.status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: res.message);
        //_getAllBookMark();
        _getMyFeed();
      });
    }
  }
  _doBookmark(String id)async{
    var res=await _httpService.doBookMark(id: id);
    if(res.status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: res.message);
        //_getAllBookMark();
        _getMyFeed();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    //getMyFeed();
    _getMyFeed();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Feed',style: TextStyle(fontFamily: 'RobotoSlab'),),),
      body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
          itemCount: data1.length,
          itemBuilder: (context,index){
            return Card(
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      new Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "${data1[index].userImage??''}"
                            ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(data1[index].userName??'',style: TextStyle(fontFamily: 'RobotoSlab'),),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text('09-11-2020',style: TextStyle(fontFamily: 'RobotoSlab'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: new IconButton(
                          icon: Icon(Icons.more_horiz,color: Colors.black,),
                          onPressed: null,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,top: 5),
                    child: Text(data1[index].text??'',style: TextStyle(color: Colors.grey,fontFamily: 'RobotoSlab'),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(
                            "${data1[index].fileUrl??''}"
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            _doLike(data1[index].id);

                          });
                          if (data1[index].isLike == 0) {
                            setState(() {
                              data1[index].isLike = 1;
                            });
                          } else if (data1[index].isLike == 1) {
                            setState(() {
                              data1[index].isLike = 0;

                            });
                          }
                        },
                        child:data1[index].isLike==1?Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.favorite,size: 20,color: Colors.red,),
                        ):Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.favorite_border,size: 20,color: Colors.black,),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentScreen(comment_data: data1[index],)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(
                            FontAwesomeIcons.comment,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(FontAwesomeIcons.shareAlt,size: 18,  color: Colors.black,),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _doBookmark(data1[index].id);

                          });
                          if (data1[index].isBookmark == 0) {
                            setState(() {
                              data1[index].isBookmark = 1;
                            });
                          } else if (data1[index].isBookmark == 1) {
                            setState(() {
                              data1[index].isBookmark = 0;

                            });
                          }
                        },
                        child: data1[index].isBookmark==1?Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(FontAwesomeIcons.bookmark,size: 20,  color: Colors.red,),
                        ):Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(FontAwesomeIcons.bookmark,size: 20,  color: Colors.grey,),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,top: 10),
                    child: Text('${data1[index].likeCount??''} likes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'RobotoSlab'),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("Livin'",style: TextStyle(fontFamily: 'RobotoSlab'),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('taht neon life!',style: TextStyle(fontFamily: 'RobotoSlab'),),
                        ),
                        /*Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('View comments',style: TextStyle(fontWeight:FontWeight.bold,color: Color(fountColor)),),
                        ),*/
                      ],
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            );
          }),

    );
  }
}
