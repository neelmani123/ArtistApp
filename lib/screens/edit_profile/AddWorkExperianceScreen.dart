import 'dart:convert';

import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/edit_profile/EditProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddWorkExperianceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddWorkExperianceScreenState();
  }
}

class AddWorkExperianceScreenState extends State<AddWorkExperianceScreen> {
  bool _isLoading = false;
  final TextEditingController position = new TextEditingController();
  final TextEditingController company_name = new TextEditingController();
  final TextEditingController start_date = new TextEditingController();
  final TextEditingController end_date = new TextEditingController();
  final TextEditingController current_work = new TextEditingController();
  final TextEditingController location = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HttpService _httpService = HttpService();
  _addData() async {
   // _isLoading=true;
    var res = await _httpService.add_Work_exp(
        position: position.text,
        comp_name: company_name.text,
        current_work: current_work.text,
        location: 'noida');
    if (res.status == true) {
      setState(() {
        _isLoading = false;
        print(res.message);
        Fluttertoast.showToast(msg: res.message);
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditProfileScreen()));
      });
    }
  }

  /*Future _addWorkExperience() async
  {
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({
      "position":position.text,
      "company_name":company_name.text,
      "start_date":"2015-10-20",
      "end_date":"2015-10-16",
      "currently_work_here":"0",
      "company_location":location.text,
      "jwtToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJ0aW1lU3RhbXAiOiIyMDIxLTA0LTEzIDEwOjQwOjAxIn0.2TNWx0yu22Uj37oqGbgNwB2cfvPNEREC6KqlbgnBJjk"
    });
    var response=await http.post("https://artist.devclub.co.in/api/Artist_api/add_work_experience",headers: headers,body: res);
    Map data=json.decode(response.body);
    print("response is:${data}");

  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key:_scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Add Work Experience',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: /*_isLoading?Container(child: Center(child: CircularProgressIndicator(),),):*/Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      //color: Colors.grey,
                      //offset: Offset(1.0, 1.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                  // borderRadius: BorderRadius.circular(10.10),
                  color: Color(blueGreyColor),
                ),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 190, top: 10),
                        child: Text(
                          "Position",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'images/job.png',
                                color: Colors.black,
                              )),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            height: 40,
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              controller: position,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Your Designation',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Container(
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      //color: Colors.grey,
                      //offset: Offset(1.0, 1.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                  // borderRadius: BorderRadius.circular(10.10),
                  color: Color(blueGreyColor),
                ),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 110, top: 10),
                        child: Text(
                          "Where did you work?",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'images/building.png',
                                color: Colors.black,
                                height: 20,
                                width: 20,
                              )),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            height: 40,
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              controller: company_name,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Company Name',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Container(
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      //color: Colors.grey,
                      //offset: Offset(1.0, 1.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                  // borderRadius: BorderRadius.circular(10.10),
                  color: Color(blueGreyColor),
                ),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 180, top: 10),
                        child: Text(
                          "start date",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image.asset('images/calendar-alt.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 180,
                            left: 10,
                          ),
                          child: Text(
                            '02-11-2020',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(),
                          child: Image.asset(
                            'images/calendar-alt.png',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Container(
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      //color: Colors.grey,
                      //offset: Offset(1.0, 1.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                  // borderRadius: BorderRadius.circular(10.10),
                  color: Color(boldColor),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        //Container(child: Image.asset(''),),
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            'I currently work here',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 90, top: 10),
                          child: Image.asset('images/dropdown_buttan.png'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Container(
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      //color: Colors.grey,
                      //offset: Offset(1.0, 1.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                  // borderRadius: BorderRadius.circular(10.10),
                  color: Color(blueGreyColor),
                ),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 200, top: 10),
                        child: Text(
                          "end date",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image.asset('images/calendar-alt.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 180,
                            left: 10,
                          ),
                          child: Text(
                            '02-11-2020',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(),
                          child: Image.asset(
                            'images/calendar-alt.png',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Container(
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      //color: Colors.grey,
                      //offset: Offset(1.0, 1.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                  // borderRadius: BorderRadius.circular(10.10),
                  color: Color(blueGreyColor),
                ),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 130, top: 10),
                        child: Text(
                          "what did you do?",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'images/home.png',
                                color: Colors.black,
                                height: 20,
                                width: 20,
                              )),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            height: 40,
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              controller: location,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Company Location',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 40),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.10),
                    ),
                    // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                        _addData();
                      });
                      //_addWorkExperience();
                    },
                    color: Color(boldColor),
                    // textColor: Colors.white,
                    child: _isLoading==true?Container(height:20,width:20,child: CircularProgressIndicator(),):Text("Save",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
