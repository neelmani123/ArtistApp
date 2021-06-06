import 'dart:convert';

import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/feed/model/Data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
  List data1;
  Future getAllPost()async
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
        data1=data['data'];
        _isLoading=false;
      });

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getAllPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                             "https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg"
                         ),

                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: Text(data1[index]['user_name']??''),
                 ),
                 Spacer(),
                 Padding(
                   padding: const EdgeInsets.only(right: 5),
                   child: Text('09-11-2020'),
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
               child: Text(data1[index]['text']??'',style: TextStyle(color: Colors.grey),),
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
                     "https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg"
                 ),

               ),
             ),
           ),
             SizedBox(height: 5,),
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 5),
                   child: Icon(Icons.favorite_border,size: 20,color: Colors.black,),
                 ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                     FontAwesomeIcons.comment,
                     size: 18,
                      color: Colors.black,
                 ),
                  ),
                 Padding(
                   padding: const EdgeInsets.only(left: 20),
                   child: Icon(FontAwesomeIcons.shareAlt,size: 18,  color: Colors.black,),
                 ),
                 Spacer(),
                 Padding(
                   padding: const EdgeInsets.only(right: 10),
                   child: Icon(FontAwesomeIcons.bookmark,size: 20,  color: Colors.grey,),
                 )
               ],
             ),
             Padding(
               padding: const EdgeInsets.only(left: 5,top: 10),
               child: Text('451 likes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 10),
               child: Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 5),
                     child: Text("Livin'"),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Text('taht neon life!'),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Text('View comments',style: TextStyle(fontWeight:FontWeight.bold,color: Color(fountColor)),),
                   ),
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
