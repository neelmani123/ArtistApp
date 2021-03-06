import 'dart:convert';

import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/feed/CommentScreen.dart';
import 'package:artist_icon/screens/feed/PhotoView.dart';
import 'package:artist_icon/screens/feed/TutorialPAge.dart';
import 'package:artist_icon/screens/feed/UserFeed.dart';
import 'package:artist_icon/screens/feed/model/Data.dart';
import 'package:artist_icon/screens/feed/model/getAllPost/feed/Data.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddFeed extends StatefulWidget {
  final Data character;
  const AddFeed({this.character,Key key}) : super(key: key);

  @override
  _AddFeedState createState() => _AddFeedState();
}

class _AddFeedState extends State<AddFeed> {
  bool _isLoading=true;
  //List data1;
  String user_id="";
  int pageCount;
  HttpService _httpService = HttpService();
  List<Dataa> data=[];

  Future<void> allFeed_listApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.getPostData(jwtToken:prefs.getString('userID'),limit:"1");
    if(res.status == true){
      setState(() {
        data= res.data;
        print("Data is:${data }");
        _isLoading=false;
      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }
  _doLike(String id)async{
    var res=await _httpService.doLike(id: id);
    if(res.status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: res.message);
       allFeed_listApi();
      });
    }
  }
  _doBookmark(String id)async{
    var res=await _httpService.doBookMark(id: id);
    if(res.status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: res.message);
        allFeed_listApi();
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    //getAllPost();
    allFeed_listApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
        itemCount: data.length,
          itemBuilder: (context,index){
        return Card(
          elevation: 0,
         child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>UserFeed(id: data[index].user_id,page_count:pageCount,)));
                   },
                   child: new Container(
                     height: 40.0,
                     width: 40.0,
                     decoration: new BoxDecoration(
                       shape: BoxShape.circle,
                       image: new DecorationImage(
                           fit: BoxFit.fill,
                           image: new NetworkImage(
                               "${data[index].user_image??''}"
                           ),

                       ),
                     ),
                   ),
                 ),
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>UserFeed(id: data[index].user_id,page_count:pageCount,)));
                   },
                   child: Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Text(data[index].user_name??'',style: TextStyle(fontFamily: 'RobotoSlab'),),
                   ),
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
               child: Text(data[index].text??'',style: TextStyle(color: Colors.grey,fontFamily: 'RobotoSlab'),),
             ),
           SizedBox(height: 10,),
             InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotoView1(image:data[index].file_url,imagetype: data[index].media_type,)));
               },
               child:data[index].media_type=="1"?Container(
                 width: MediaQuery.of(context).size.width,
                 height: 250,
                 decoration: new BoxDecoration(
                   shape: BoxShape.rectangle,
                   image: new DecorationImage(
                     fit: BoxFit.cover,
                     image: new NetworkImage(
                         "${data[index].file_url??''}"
                     ),
                   ),
                 ),
               ):Container(
                 width: MediaQuery.of(context).size.width,
                 height: 200,
                 child: BetterPlayer.network("${data[index].file_url}",
                   betterPlayerConfiguration: BetterPlayerConfiguration(
                     aspectRatio: 1,
                     looping: true,
                     autoPlay: false,
                     fit: BoxFit.cover,

                   ),),

               ),
             ),
             /*Container(
               width: MediaQuery.of(context).size.width,
               height: 250,
               child: PhotoView(
                   imageProvider: NetworkImage("${data1[index]['file_url']??''}")),
             ),*/
             SizedBox(height: 5,),
             Row(
               children: [
                 InkWell(
                   onTap: (){
                    setState(() {
                      _isLoading==true;
                      _doLike(data[index].id);
                    });
                     if (data[index].is_like == 0) {
                       setState(() {
                         data[index].is_like = 1;
                       });
                     } else if (data[index].is_like == 1) {
                       setState(() {
                         data[index].is_like = 0;
                         print(
                             "Tab working here${widget.character.is_like}");
                       });
                     }
                   },
                   child:data[index].is_like==1?Padding(
                     padding: const EdgeInsets.only(left: 5),
                     child: Icon(Icons.favorite,size: 20,color: Colors.red,),
                   ):Padding(
                     padding: const EdgeInsets.only(left: 5),
                     child: Icon(Icons.favorite_border,size: 20,color: Colors.black,),
                   ),
                 ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentScreen(comment_data: data[index].comment_data,id: data[index].id,)));
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
                       _doBookmark(data[index].id);
                     });
                     if (data[index].is_bookmark == 0) {
                       setState(() {
                         data[index].is_bookmark = 1;
                       });
                     } else if (data[index].is_bookmark == 1) {
                       setState(() {
                         data[index].is_bookmark = 0;
                         print(
                             "Tab working here${widget.character.is_like}");
                       });
                     }
                   },
                   child: data[index].is_bookmark==1?Padding(
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
               child: Text('${data[index].like_count??''} likes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'RobotoSlab'),),
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
             SizedBox(height: 5,),
             Container(
               child: RaisedButton(
                   color: Color(fountColor),
                   child: Text("${data[index].is_tutorial} Tutorial",style: TextStyle(color: Colors.white,fontFamily: 'RobotoSlab'),),
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>TutorialPAge(isPlay:data[index].is_play,id:data[index].id,data: data[index].product_data,name: data[index].user_name,img: data[index].user_image,price: data[index].price,)));
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


