import 'dart:convert';

import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/feed/JobDetails.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AppliedJobList extends StatefulWidget {
  const AppliedJobList({Key key}) : super(key: key);

  @override
  _AppliedJobListState createState() => _AppliedJobListState();
}

class _AppliedJobListState extends State<AppliedJobList> {
  bool _isLoading=true;
  List data1;
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


  Future appliedJobList()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID')});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Artist_api/user_applied_list",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    print('Status is:${status}');
    if(status==true)
    {
      setState(() {
        _isLoading=false;
        data1=data['data'];
        for(int i=0;i<data1.length;i++)
          {
            setState(() {
              select_type=data1[i]['select_type'];
              select();

            });
          }
        Fluttertoast.showToast(msg: data['message']);
        /*Navigator.push(context, MaterialPageRoute(builder: (context)=>AppliedJobList()));*/

      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    appliedJobList();
    super.initState();
  }
  var colors = [
    Color(0xFFACDEE5),
    Color(0xFFC8ABCA),
    Color(0xFFF3B0C2),
    Color(0xFFACDEE5),
    Color(0xFFC8ABCA),
    Color(0xFFF3B0C2),
    Color(0xFFACDEE5),
    Color(0xFFC8ABCA),
    Color(0xFFF3B0C2),
    Color(0xFFACDEE5),
    Color(0xFFC8ABCA),
    Color(0xFFF3B0C2),
    Color(0xFFACDEE5),
    Color(0xFFC8ABCA),
    Color(0xFFF3B0C2),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Applied List'),),
      body: _isLoading==true?Container(child: Center(
        child: CircularProgressIndicator(),
      ),):ListView.builder(
        itemCount: data1.length,
          itemBuilder: (BuildContext,index){
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetails(details: data1[index],)));
            },
            child: Card(
              color: colors[index],
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      new Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg"
                              )
                          ),
                        ),
                        //child: Image.network('https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg'),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,bottom: 10),
                            child: Text('${data1[index]['company_name']??''}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'RobotoSlab'),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('15 days ago',style: TextStyle(fontFamily: 'RobotoSlab'),),
                          ),
                        ],
                      ),

                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 18,top: 15),
                    child: Row(
                      children: [
                        Image.asset('images/description.png',width: 28,height: 28,color: Color(fountColor),),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('${data1[index]['job_description']??''}',style: TextStyle(fontSize: 15,fontFamily: 'RobotoSlab'),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18,top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.access_time,color: Color(fountColor),size: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('1-3 years',style: TextStyle(fontFamily: 'RobotoSlab'),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18,top: 15),
                    child: Row(
                      children: [
                        Image.asset('images/location.png',width: 25,height: 25,color: Color(fountColor),),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('${data1[index]['location']??''}',style: TextStyle(fontFamily: 'RobotoSlab'),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18,top: 15),
                    child: Row(
                      children: [
                        Image.asset('images/skills.png',width: 25,height: 25,color: Color(fountColor),),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('${data1[index]['other_skills']??''}',style: TextStyle(fontFamily: 'RobotoSlab'),),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 170,
                        margin: const EdgeInsets.only(top: 10,bottom: 20),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),),
                          // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                          onPressed: () async{
                            setState(() {

                            });
                          },
                          color: Colors.white,
                          // textColor: Colors.white,
                          child: Text("${choice}",
                              style: TextStyle(color: Color(fountColor))),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

