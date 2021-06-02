import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:artist_icon/screens/feed/AppliedUserDetails.dart';
class AppliedJobPostList extends StatefulWidget {
   final String id;
  const AppliedJobPostList({this.id,Key key}) : super(key: key);


  @override
  _AppliedJobPostListState createState() => _AppliedJobPostListState();
}

class _AppliedJobPostListState extends State<AppliedJobPostList> {
  List data1;
  bool _isLoading=true;
  Future appliedDetails()async{
    print("id is:${widget.id}");
    final _prefs = await SharedPreferences.getInstance();
    print("Token is:${_prefs.getString('userID')}");
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'),
      "job_id":widget.id.toString()});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Artist_api/applied_job_post_list",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    print('Status is:${status}');
    print("Message is:${data['message']}");
    if(data['status']==true)
    {
      setState(() {
        data1=data['data'];
        Fluttertoast.showToast(msg: data['message']);
        _isLoading=false;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    appliedDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applied Job Post'),
      ),
      body:_isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
        itemCount: 1,
          itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AppliedUserDetails(details: data1[index],)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children:
                [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text("${data1[index]['name']??''}",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text("${data1[index]['email']}")
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text("${data1[index]['phone']}")
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        );
      })

    );
  }
}
