import 'dart:convert';

import 'package:artist_icon/screens/Color.dart';
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
  bool _isLoading;
  bool loading;
  List data1,data2;
  Map data;
  Future getuserFeed()async
  {
    loading=true;
    final _prefs = await SharedPreferences.getInstance();
    print("Token is:${_prefs.getString('userID')}");
    print("Token is:${widget.id}");
    print("Page Count is:${widget.page_count}");
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'),"pages":widget.page_count,"id_user":widget.id});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Feed_api/user_feed",
        body: res);
     data = json.decode(response.body);
    print(data);
    var status = data['status'];
    print('Status is:${status}');
    if(status==true||status== false)
    {
      loading=false;
      setState(() {
        data1=data['data'];
        // print("UserId Is:${data[0]['id']}");

      });

    }
  }
  Future doLike(String id)async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'),"post_id":id});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Feed_api/do_like",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    if(status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: data['message']);
        getAllPost();
        // count=data['like_count'];
      });
    }

  }
  Future doBookmark(String id)async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'),"post_id":id});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Feed_api/do_bookmark",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    if(status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: data['message']);
        getAllPost();

      });
    }

  }
  Future getAllPost()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'),"pages":"1"});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Feed_api/get_all_post",
        body: res);
    Map data = json.decode(response.body);
    print(data);
    var status = data['status'];
    print('Status is:${status}');

    if(status==true)
    {
      setState(() {
        data2=data['data'];
        // print("UserId Is:${data[0]['id']}");
        _isLoading=false;
      });

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getAllPost();
    getuserFeed();
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Feed"),
      ),
      body: loading==true?Container(child: Center(child: CircularProgressIndicator(
      ),),):
      ListView.builder(
        itemCount: 1,
          itemBuilder: (context,index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "${data['profile_image']??''}"
                    ),

                  ),
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Center(
                      child: CircleAvatar(
                        radius: 55,
                        child: ClipOval(child: Image.network(data['profile_image']??'', height: 100, width: 100, fit: BoxFit.cover,),),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(data['user_name']??'',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
            ),
            /*Padding(
            padding: const EdgeInsets.only(left: 5,top: 5),
            child: Text(data['text']??'',style: TextStyle(color: Colors.grey),),
          ),*/
            SizedBox(height: 10,),
            /* Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage(
                    "${data['file_url']??''}"
                ),

              ),
            ),
          ),*/
            SizedBox(height: 5,),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      _isLoading==true;
                      doLike(data2[index]['id']);
                    });
                    if (data2[index]['is_like'] == 0) {
                      setState(() {
                        data2[index]['is_like'] = 1;
                      });
                    } else if (data2[index]['is_like'] == 1) {
                      setState(() {
                        data2[index]['is_like'] = 0;

                      });
                    }
                  },
                  child:data2[index]['is_like']==1?Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(Icons.favorite,size: 20,color: Colors.red,),
                  ):Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(Icons.favorite_border,size: 20,color: Colors.black,),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentScreen(comment_data: data2[index],)));
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
                      doBookmark(data2[index]['id']);
                    });
                    if (data2[index]['is_bookmark'] == 0) {
                      setState(() {
                        data2[index]['is_bookmark'] = 1;
                      });
                    } else if (data2[index]['is_bookmark'] == 1) {
                      setState(() {
                        data2[index]['is_bookmark'] = 0;

                      });
                    }
                  },
                  child: data2[index]['is_bookmark']==1?Padding(
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
              child: Text('${data2[index]['like_count']??''} likes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
                  /*Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('View comments',style: TextStyle(fontWeight:FontWeight.bold,color: Color(fountColor)),),
                ),*/
                ],
              ),
            ),
            SizedBox(height: 10,)
          ],
        );
      })

    );
  }

}
