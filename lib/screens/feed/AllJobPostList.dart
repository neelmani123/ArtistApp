import 'dart:convert';
import 'package:artist_icon/model/SearchJobModel1/SearchJobData.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
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
  List<Data> data2;
  var isApplied1="Applied";
  String choice;
  HttpService _httpService = HttpService();
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
  _jobPost()async{
    var res= await _httpService.searchJob1(skillId: "1",jobId: "1",cityId: "");
     if(res.status==true)
       {
         setState(() {
        data2=res.data;
       /* for(int i=0;i<data2.length;i++)
          {
            setState(() {
              isApplied1=data2[i].isApplied;
              if(data1[i]['is_applied']=="0")
              {
                isApplied1="Apply Now";
              }
              else
              {
                isApplied1="Applied";

              }
            });
          }*/
        _isLoading=false;
         });
       }
  }
  _appliedJobApi(String id)async{
    var res= await _httpService.searchJobApplied(jobPostId: id);
    if(res.status==true)
      {
        setState(() {
          _isLoading=false;
          Fluttertoast.showToast(msg: res.message);
        });
      }
    else if(res.status==false){
      setState(() {
        _isLoading=false;
        Fluttertoast.showToast(msg: res.message);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jobPost();
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
            itemCount: data2.length,
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
                                      "https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg"
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
                                child: Row(
                                  children: [
                                    Text('${data2[index].companyName??''}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'RobotoSlab'),),
                                  ],
                                ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        child: Row(
                          children: [
                            Image.asset('images/description.png',width: 30,height: 30,color: Color(fountColor),),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('${data2[index].jobDescription??''}',style: TextStyle(fontSize: 15,fontFamily: 'RobotoSlab'),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 5),
                        child: Row(
                          children: [
                            Icon(Icons.access_time,color: Color(fountColor),),
                            Padding(
                              padding: const EdgeInsets.only(left: 22),
                              child: Text('1-3 years',style: TextStyle(fontFamily: 'RobotoSlab'),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 15),
                        child: Row(
                          children: [
                            Image.asset('images/location.png',width: 30,height: 30,color: Color(fountColor),),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('${data2[index].location??''}',style: TextStyle(fontFamily: 'RobotoSlab'),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 15),
                        child: Row(
                          children: [
                            Image.asset('images/skills.png',width: 30,height: 30,color: Color(fountColor),),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('${data2[index].otherSkills??''}',style: TextStyle(fontFamily: 'RobotoSlab'),),
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
                                  _isLoading=true;
                                  _appliedJobApi(data2[index].id);

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
