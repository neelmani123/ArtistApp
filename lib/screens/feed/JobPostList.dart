import 'package:artist_icon/screens/Color.dart';
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
  List data1;
  Future _jobPostList()async
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
                    )
                  ],
                ),
              ],
            );
          })
    );
  }
}