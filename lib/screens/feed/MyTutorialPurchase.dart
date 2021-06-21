import 'package:artist_icon/model/TutorialPurchaseList/TutorilaPurchaseListData.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/feed/MyTutorialPurchasePage.dart';
import 'package:artist_icon/screens/feed/model/BookMarkTutorial.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MyTutorialPurchase extends StatefulWidget {
  const MyTutorialPurchase({Key key}) : super(key: key);

  @override
  _MyTutorialPurchaseState createState() => _MyTutorialPurchaseState();
}

class _MyTutorialPurchaseState extends State<MyTutorialPurchase> {
  bool _isLoading=true;
  List<Data> data1;
  HttpService _httpService = HttpService();
  /*Future getMyTutorialList()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'),"pages":"2"});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Feed_api/get_my_tutorial_purchase_list",
        body: res);
    Map data = json.decode(response.body);
    print("data is :${data}");
    setState(() {
      if(data['status']==true)
        {
          _isLoading=false;
          Fluttertoast.showToast(msg: data['message']);
          data1=data['data'];

        }
    });

  }*/
  _getTutorialPurchaseList()async{
    var res=await _httpService.getMyTutorialPurchaseList();
    if(res.status==true)
      {
        setState(() {
          data1=res.data;
          _isLoading=false;
          Fluttertoast.showToast(msg: res.message);
        });
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    //getMyTutorialList();
    _getTutorialPurchaseList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Tutorial List",style: TextStyle(fontFamily: 'RobotoSlab'),),),
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
                            _isLoading==true;
                           // _doLike(data1[index].id);
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
                            //_doBookmark(data2[index].id);
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
                        child: Text("${data1[index].isTutorial} Tutorial",style: TextStyle(color: Colors.white,fontFamily: 'RobotoSlab'),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTutorialPurchasePage(isPlay:data1[index].isPlay,id:data1[index].id,data: data1[index].productData,name: data1[index].userName,img: data1[index].userImage,price: data1[index].price,)));
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
