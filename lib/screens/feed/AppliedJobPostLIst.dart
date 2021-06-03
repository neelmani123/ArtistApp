import 'dart:convert';
import 'package:artist_icon/screens/Color.dart';
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
  String select_type;
  String choice;
  Future select(){
    String no=select_type;
    switch(no)
    {
      case '0':
        choice="Pending";
        break;
      case '1':
        choice = "Shortlist Application";
        break;
      case '2':
        choice="Interview";
        break;
      case '3':
        choice="selected";
        break;
      case '4':
        choice="not selected";
        break;
      default:
        choice = null;

    }
  }
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
    if(data['status']==true)
    {
      setState(() {
        data1=data['data'];
        select_type=data1[0]['select_type'];
       // print("Select type is:${data1[0]['select_type']}");
        select();
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
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AppliedUserDetails(details: data1[index],type: data1[index]['select_type'],)));
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
                        Text("${data1[index]['name']??''}",style: TextStyle(fontSize: 20),),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 15,top: 10),
                          height:30,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Color(fountColor),
                          ),
                          padding: EdgeInsets.only(left: 25,top: 5,),
                          child: Text("${choice??''}",style: TextStyle(color: Colors.white),),
                        ),
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
