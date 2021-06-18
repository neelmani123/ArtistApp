import 'dart:convert';
import 'package:artist_icon/screens/feed/AppliedJobList.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:artist_icon/screens/Color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllJobPostList extends StatefulWidget {
  const AllJobPostList({Key key}) : super(key: key);

  @override
  _AllJobPostListState createState() => _AllJobPostListState();
}

class _AllJobPostListState extends State<AllJobPostList> {
  bool _isLoading=true;
  List data1;
  var isApplied1;
  String choice;
  /*Future select(){
    switch(isApplied)
    {
      case "0":
        choice="Apply Now";
        break;
      case "1":
        choice = "Applied";
        break;
      default:
        choice = null;

    }
  }*/
  Future _jobPostList()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({
      "jwtToken": _prefs.getString('userID'),
      "Skills_id":"1",
      "job_type":"1",
      "city_id":""
    });
    var response = await http.post(
        "https://artist.devclub.co.in/api/Artist_api/search_job",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    print('Status is:${status}');
    if(status==true)
    {
      setState(() {
        data1=data['data'];
        for(int i=0;i<data1.length;i++)
          {
           setState(() {
             isApplied1=data1[i]['is_applied'];
             print("Is applied is:${data1[i]['is_applied']}");
             if(data1[i]['is_applied']=="0")
               {
                 isApplied1="Apply Now";
               }
             else
               {
                 isApplied1="Applied";

             }

           });
          }
        _isLoading=false;
      });
    }
  }
  Future appliedJobApi(String id)async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'),"job_post_id":id});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Artist_api/user_applied_job",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    print('Status is:${status}');
    if(status==true)
    {
      setState(() {
        _isLoading=false;
        Fluttertoast.showToast(msg: data['message']);
        /*Navigator.push(context, MaterialPageRoute(builder: (context)=>AppliedJobList()));*/

      });
    }
    else if(status==false)
      {
        setState(() {
          _isLoading=false;
          Fluttertoast.showToast(msg: data['message']);
        });
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jobPostList();
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
        backgroundColor: Colors.white,
         appBar: AppBar(title: Text("Search Job List"),),
        body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
            itemCount: data1.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(5.0),
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
                                      "${data1[index]['img']??''}"
                                  )
                              ),
                            ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        child: Text('${data1[index]['job_description']??''}',style: TextStyle(fontSize: 15,fontFamily: 'RobotoSlab'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,),
                        child: Text('1-3 years',style: TextStyle(fontFamily: 'RobotoSlab'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 5),
                        child: Text('${data1[index]['location']??''}',style: TextStyle(fontFamily: 'RobotoSlab'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 5),
                        child: Text('${data1[index]['other_skills']??''}',style: TextStyle(fontFamily: 'RobotoSlab'),),
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
                                  _isLoading=true;
                                  appliedJobApi(data1[index]['id']);

                                });
                              },
                              color: Colors.white,
                              // textColor: Colors.white,
                              child: Text("${isApplied1}",
                                  style: TextStyle(color: Color(fountColor))),
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              );
            })
    );
  }
}
