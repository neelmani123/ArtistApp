import 'dart:convert';

import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/edit_profile/EditProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AddWorkExperianceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddWorkExperianceScreenState();
  }
}

class AddWorkExperianceScreenState extends State<AddWorkExperianceScreen> {
  bool _isLoading = false;
  bool isSwitched = false;
  final TextEditingController position = new TextEditingController();
  final TextEditingController company_name = new TextEditingController();
  final TextEditingController start_date = new TextEditingController();
  final TextEditingController end_date = new TextEditingController();
  final TextEditingController current_work = new TextEditingController();
  final TextEditingController location = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HttpService _httpService = HttpService();
  DateTime _date = DateTime.now();
  DateTime _date1 = DateTime.now();
  String _formatteddate="",_formatteddate1="";


  _addData() async {
    _isLoading=true;
    var res = await _httpService.add_Work_exp(
        position: position.text,
        comp_name: company_name.text,
        current_work1: result1.toString(),
        company_location: location.text,
      startDate: _formatteddate,
      endDate: _formatteddate1
    );
    if (res.status == true) {
      setState(() {
        _isLoading = false;
        print(res.message);
        Fluttertoast.showToast(msg: res.message);
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditProfileScreen()));
      });
    }
  }
  /*This Method is use for the Date Picker Dialog*/
  Future<Null> selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
      });
    }
  }
  /*This Method is use for the Date Picker Dialog1*/
  Future<Null> selectDate1(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: _date1,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
    if (_datePicker != null && _datePicker != _date1) {
      setState(() {
        _date1 = _datePicker;
      });
    }
  }
  var textValue = 'Switch is OFF';
  void toggleSwitch(bool value) {
    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  var result1=0;
  getTutorial(bool isSwitched){
    switch(isSwitched)
    {
      case true :
        result1=1;
        print("Result is :${result1}");
        break;
      case false:
        result1=0;
        print("Result is :${result1}");
        break;
    }
    return result1;
  }

  @override
  Widget build(BuildContext context) {
     _formatteddate = new DateFormat.yMMMd().format(_date);
     _formatteddate1 = new DateFormat.yMMMd().format(_date1);
    // TODO: implement build
    return Scaffold(
      key:_scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Add Work Experience',
          style: TextStyle(color: Colors.black,fontFamily: 'RobotoSlab'),
        ),
      ),
      body: /*_isLoading?Container(child: Center(child: CircularProgressIndicator(),),):*/Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 47,top: 10),
                      child: Text('Position',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    TextFormField(
                      controller: position,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Image.asset(
                            'images/job.png',
                            width: 40,
                            height: 40,
                            color: Colors.black,
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 47,top: 10),
                      child: Text('Where did you work?',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    TextFormField(
                      controller: company_name,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Image.asset(
                            'images/job.png',
                            width: 40,
                            height: 40,
                            color: Colors.black,
                          )
                      ),
                    )

                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: InkWell(
                onTap: (){
                  setState(() {
                    selectDate(context);
                    print(_formatteddate);
                  });
                },
                child: Container(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 47,top: 10),
                        child: Text('Start Date',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Image.asset(
                              'images/calendar-alt.png',
                              width: 40,
                              height: 40,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:10),
                            child: Text(
                              "${_formatteddate} ",
                              style: TextStyle(color: Colors.black,fontSize: 15),
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            'images/calendar-alt.png',
                            width: 40,
                            height: 40,
                            color: Color(fountColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //Container(child: Image.asset(''),),
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            'I currently work here',
                            style: TextStyle(color: Colors.black,fontSize: 15),
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 40,
                            margin: EdgeInsets.only(top: 10,right: 10),
                            child: Switch(
                              onChanged: toggleSwitch,
                              value: isSwitched,
                              activeColor: Color(fountColor),
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                            )
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: InkWell(
                onTap: (){
                  setState(() {
                    selectDate1(context);
                    print(_formatteddate);
                  });
                },
                child: Container(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 47,top: 10),
                        child: Text('End Date',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Image.asset(
                              'images/calendar-alt.png',
                              width: 40,
                              height: 40,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:10),
                            child: Text(
                              "${_formatteddate1} ",
                              style: TextStyle(color: Colors.black,fontSize: 15),
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            'images/calendar-alt.png',
                            width: 40,
                            height: 40,
                            color: Color(fountColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 47,top: 10),
                      child: Text('What did you do?',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    TextFormField(
                      controller: location,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon:  Image.asset(
                            'images/home.png',
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 40),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                    ),

                    onPressed: () {
                      setState(() {
                        getTutorial(isSwitched);
                        _isLoading = true;
                        _addData();
                      });
                    },
                    color: Color(fountColor),
                    // textColor: Colors.white,
                    child: _isLoading==true?Container(height:20,width:20,child: CircularProgressIndicator(),):Text("SAVE",
                        style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'RobotoSlab')),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
