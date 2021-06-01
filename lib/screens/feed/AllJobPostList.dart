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
  String isApplied='';
  String textName='';
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
           isApplied=data1[i]['is_applied'];
           print("Is applied is:${data1[i]['is_applied']}");
           if(data1[i]['is_applied']==0)
           {
             setState(() {
               textName='Apply Now';
             });

           }
           else if(data1[i]['is_applied']==1){
             setState(() {
               textName='Applied';
             });
           }
           else{
             textName='Apply Now';
           }
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(title: Text("Job Post List"),),
        body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
            itemCount: data1.length,
            itemBuilder: (context,index){
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* InkWell(
                  onTap: ()
                  {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,left: 15),
                    child: Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                ),*/
                  SizedBox(height: 20,),
                  Center(
                    child: Column(
                      children: [
                        new Container(
                          height: 60.0,
                          width: 60.0,
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
                        SizedBox(height: 10,),
                        Text('${data1[index]['title']??''}',style: TextStyle(color: Colors.white),),
                        SizedBox(height: 10,),
                        Text('${data1[index]['company_name']+",noida"}',style: TextStyle(color: Colors.pink),),
                        SizedBox(height: 5,),
                        Text('Posted on ${data1[index]['created_at']}',style: TextStyle(color: Colors.pink),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Container(
                        width: 190,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'working Hours',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'Full Time',
                                style: TextStyle(
                                    color: Color(fountColor),
                                    fontSize: 17),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 190,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border: Border.all(

                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Monthly Salary',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                '30k-50k',
                                style: TextStyle(
                                    color: Color(fountColor),
                                    fontSize: 17),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Color(fountColor),fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(text: 'Job', style: TextStyle(decoration: TextDecoration.underline)),
                              TextSpan(text: ' Description', style: TextStyle())
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("${data1[index]['job_description']}",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Color(fountColor),fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(text: 'Key', style: TextStyle(decoration: TextDecoration.underline)),
                              TextSpan(text: ' Skills', style: TextStyle())
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("Ballet,Ballroom,Contemporary",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Color(fountColor),fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(text: 'Other', style: TextStyle(decoration: TextDecoration.underline)),
                              TextSpan(text: ' Details', style: TextStyle())
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("${data1[index]['other_skills']}",style: TextStyle(color: Colors.white),),
                      ),
                      Center(
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(top: 20,bottom: 20),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.10),),
                            // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                            onPressed: () async{
                              setState(() {
                                _isLoading=true;
                               appliedJobApi(data1[index]['id']);
                              // print(data1[index]['id']);
                              });
                            },
                            color: Color(fountColor),
                            // textColor: Colors.white,
                            child: Text("${textName}",
                                style: TextStyle(fontSize: 20,color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            })
    );
  }
}
