import 'dart:convert';

import 'package:artist_icon/model/GetUserFeed/GetUserFeedData.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/feed/CommentScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class UserFeed extends StatefulWidget {
  final id;
  final page_count;
  const UserFeed({this.id,this.page_count,Key key}) : super(key: key);

  @override
  _UserFeedState createState() => _UserFeedState();
}

class _UserFeedState extends State<UserFeed> {
  @override
  bool _isLoading=true;
  bool loading;
  List data1,data2;
  List<Data> data3;
  Map data;
  HttpService _httpService = HttpService();
  _getUserFeed()async{
    var res=await _httpService.getUserFeedDetails(id: widget.id,pages: widget.page_count);
    if(res.status==true)
      {
        setState(() {
          data3=res.data;
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
        _getUserFeed();
      });
    }
  }
  _doBookmark(String id)async{
    var res=await _httpService.doBookMark(id: id);
    if(res.status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: res.message);
        _getUserFeed();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _getUserFeed();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Feed",style: TextStyle(fontFamily: 'RobotoSlab'),),),
      body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
          itemCount: 1,
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
                                "${data3[index].userImage??''}"
                            ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(data3[index].userName??'',style: TextStyle(fontFamily: 'RobotoSlab'),),
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
                    child: Text(data3[index].text??'',style: TextStyle(color: Colors.grey,fontFamily: 'RobotoSlab'),),
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
                            "${data3[index].fileUrl??''}"
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
                            _isLoading==true;
                            _doLike(data3[index].id);
                          });
                          if (data3[index].isLike == 0) {
                            setState(() {
                              data3[index].isLike = 1;
                            });
                          } else if (data3[index].isLike == 1) {
                            setState(() {
                              data3[index].isLike = 0;

                            });
                          }
                        },
                        child:data3[index].isLike==1?Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.favorite,size: 20,color: Colors.red,),
                        ):Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.favorite_border,size: 20,color: Colors.black,),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentScreen(data: data1[index],)));
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
                            _isLoading==true;
                            _doBookmark(data3[index].id);
                          });
                          if (data3[index].isBookmark == 0) {
                            setState(() {
                              data3[index].isBookmark = 1;
                            });
                          } else if (data3[index].isBookmark == 1) {
                            setState(() {
                              data3[index].isBookmark = 0;

                            });
                          }
                        },
                        child: data3[index].isBookmark==1?Padding(
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
                    child: Text('${data3[index].likeCount??''} likes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'RobotoSlab'),),
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
                        /* Padding(
                         padding: const EdgeInsets.only(left: 10),
                         child: Text('View comments',style: TextStyle(fontWeight:FontWeight.bold,color: Color(fountColor)),),
                       ),*/
                      ],
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                        color: Color(fountColor),
                        child: Text("${data3[index].isTutorial} Tutorial",style: TextStyle(color: Colors.white,fontFamily: 'RobotoSlab'),),
                        onPressed: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>BookMarkTutorial(isPlay:data2[index].isPlay,id:data2[index].id,data: data2[index].productData,name: data2[index].userName,img: data2[index].userImage,price: data2[index].price,)));
                        }),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            );
          }),
    );
  }

}
