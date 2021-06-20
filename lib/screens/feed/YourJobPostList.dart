import 'package:artist_icon/model/YourJobPostListModel/JobPostData.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/feed/AppliedJobPostLIst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class JobPostList extends StatefulWidget {
  const JobPostList({Key key}) : super(key: key);

  @override
  _JobPostListState createState() => _JobPostListState();
}

class _JobPostListState extends State<JobPostList> {
  bool _isLoading=true;
  //List data1;
  List<Data> data2;
  HttpService _httpService = HttpService();
  /*Future _jobPostList()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID')});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Artist_api/your_job_post_list",
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
  }*/

  _jobList()async{
    var res=await _httpService.jobPostList();
    if(res.status==true)
    {
     setState(() {
       data2=res.data;
       _isLoading=false;
     });
      print("List is Find:${data2}");
    }
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
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_jobPostList();
    _jobList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Your Job List",style: TextStyle(fontFamily: 'RobotoSlab'),),),
      body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
        itemCount: data2.length-1,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
                              child: Text('${data2[index].companyName??''}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'RobotoSlab'),),
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
                      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                      child: Row(
                        children: [
                          Image.asset('images/description.png',width: 28,height: 28,color: Color(fountColor),),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('${data2[index].jobDescription??''}',style: TextStyle(fontSize: 15,fontFamily: 'RobotoSlab'),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18,),
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
                      padding: const EdgeInsets.only(left: 18,top: 10),
                      child: Row(
                        children: [
                          Image.asset('images/location.png',width: 25,height: 25,color: Color(fountColor),),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('${data2[index].location??''}',style: TextStyle(fontFamily: 'RobotoSlab'),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18,top: 10),
                      child: Row(
                        children: [
                          Image.asset('images/skills.png',width: 25,height: 25,color: Color(fountColor),),
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
                          height: 30,
                          width: 250,
                          margin: const EdgeInsets.only(top: 10,bottom: 20),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),),
                            // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                            onPressed: () async{
                              setState(() {
                                // _uploadImage();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AppliedJobPostList(id: data2[index].jobId,)));

                              });
                            },
                            color: Colors.white,
                            // textColor: Colors.white,
                            child: Text("Applied Application:${data2[index].appliedCount}",
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
