import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/LoginWithMobile/LoginMobile.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
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
class Splash2 extends StatelessWidget {
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