import 'dart:convert';

import 'package:artist_icon/model/GetAllBookMark/GetBookMarkData.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/feed/TutorialPAge.dart';
import 'package:artist_icon/screens/feed/model/BookMarkTutorial.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
class Bookmark extends StatefulWidget {
  const Bookmark({Key key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  bool _isLoading=true;
  HttpService _httpService = HttpService();
  List<Data> data2;
  _getAllBookMark()async{
    var res=await _httpService.getBookMarkDetails();
    if(res.status==true)
      {
        setState(() {
          data2=res.data;
          _isLoading=false;
          print("MOdel Dara uhvshfuajvjvhjvhvhvhv:${data2}");
        });
      }
  }
  _doLike(String id)async{
    var res=await _httpService.doLike(id: id);
    if(res.status==true)
      {
        setState(() {
          Fluttertoast.showToast(msg: res.message);
          _getAllBookMark();
        });
      }
  }
  _doBookmark(String id)async{
    var res=await _httpService.doBookMark(id: id);
    if(res.status==true)
      {
        setState(() {
          Fluttertoast.showToast(msg: res.message);
          _getAllBookMark();
        });
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    _getAllBookMark();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bookmark",style: TextStyle(fontFamily: 'RobotoSlab'),),),
     body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
         itemCount: data2.length,
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
                               "${data2[index].userImage??''}"
                           ),

                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: Text(data2[index].userName??'',style: TextStyle(fontFamily: 'RobotoSlab'),),
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
                   child: Text(data2[index].text??'',style: TextStyle(color: Colors.grey,fontFamily: 'RobotoSlab'),),
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
                           "${data2[index].fileUrl??''}"
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
                           _doLike(data2[index].id);
                         });
                         if (data2[index].isLike == 0) {
                           setState(() {
                             data2[index].isLike = 1;
                           });
                         } else if (data2[index].isLike == 1) {
                           setState(() {
                             data2[index].isLike = 0;

                           });
                         }
                       },
                       child:data2[index].isLike==1?Padding(
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
                           _doBookmark(data2[index].id);
                         });
                         if (data2[index].isBookmark == 0) {
                           setState(() {
                             data2[index].isBookmark = 1;
                           });
                         } else if (data2[index].isBookmark == 1) {
                           setState(() {
                             data2[index].isBookmark = 0;

                           });
                         }
                       },
                       child: data2[index].isBookmark==1?Padding(
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
                   child: Text('${data2[index].likeCount??''} likes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'RobotoSlab'),),
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
                       child: Text("${data2[index].isTutorial} Tutorial",style: TextStyle(color: Colors.white,fontFamily: 'RobotoSlab'),),
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>BookMarkTutorial(isPlay:data2[index].isPlay,id:data2[index].id,data: data2[index].productData,name: data2[index].userName,img: data2[index].userImage,price: data2[index].price,)));
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
