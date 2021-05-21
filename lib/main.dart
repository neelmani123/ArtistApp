import 'dart:async';

import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/LoginWithMobile/LoginMobile.dart';
import 'package:artist_icon/screens/home_page/Home.dart';
import 'package:artist_icon/screens/home_page/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(blueGreyColor),
          scaffoldBackgroundColor:   Color(blueGreyColor)
      ),
      title: 'Artist Icon',

      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Splash2 extends StatefulWidget {
  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }
  Future<void> navigationPage() async {

    var _prefs = await SharedPreferences.getInstance();
   String  _userId = _prefs.getString('userID')??'';
    if(_userId != null && _userId != '')
    {
      print("User Id is:${_userId}");
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
    }
    else
    {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginMobile()), (Route<dynamic> route) => false);

    }
  }
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 7,
      navigateAfterSeconds: new LoginMobile(),
      image:  Image.asset('images/logo.png',color:  Color(rec_job_heading),),
      //loadingText: Text("Loading"),
      photoSize: 100.0,
      // loaderColor: Colors.black,
    );
  }
}
