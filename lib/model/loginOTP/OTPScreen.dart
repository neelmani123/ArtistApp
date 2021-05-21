import 'dart:io';

import 'package:artist_icon/helper/setup.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/home_page/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreen extends StatefulWidget {
  final String mobileNumber;
  final String status;
  final String name;
  final String email;
  OTPScreen({ this.mobileNumber,  this.status,this.name,this.email});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OTPScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final GlobalKey<State> _otpScreenLoader = new GlobalKey<State>();
  final httpService = HttpService();
  String _deviceId = '';
  String _deviceToken = '';
  String _deviceType = 'WEB';
  bool _isLoading;

  Future<void> initDeviceInfo() async {
    String deviceid = "12345";
    final _prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _deviceId = deviceid;
      _deviceToken = _prefs.getString("deviceToken");
      if (Platform.isAndroid) {
        _deviceType = 'Android';
      } else if (Platform.isIOS) {
        _deviceType = 'IOS';
      }
    });
  }

  Widget animatingBorders() {
    BoxDecoration pinPutDecoration = BoxDecoration(
      color: Color(appBackGreyColor),
      borderRadius: BorderRadius.circular(30),
    );
    return PinPut(
      fieldsCount: 4,
      eachFieldHeight: 50,
      eachFieldWidth: 50,
      focusNode: _pinPutFocusNode,
      controller: _pinPutController,
      submittedFieldDecoration: pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(10),
          gradient: loginButtonGradient()),
      textStyle: TextStyle(color: Colors.white, fontSize: 20),
      pinAnimationType: PinAnimationType.slide,
      selectedFieldDecoration: pinPutDecoration,
      followingFieldDecoration: pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(10),
          color: Color(appBackGreyColor)),
    );
  }

  _submitOtp() async{
    if(_pinPutController.text.length == 4){
      if(widget.status == 'login') {
        var res = await httpService.users_login_api(number:widget.mobileNumber,otp:_pinPutController.text);
        if(res.status == true){
          _isLoading=false;
          Fluttertoast.showToast(msg: "Success");
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('session', "1");
          prefs.setString('open_first', '1');
          prefs.setString('userID', res.data.jwtToken);
          prefs.setString('name', res.data.name);
          prefs.setString('mobile', res.data.phone);
          prefs.setString('email', res.data.email);
          Navigator.pop(context);
          print("Token is :${res.data.jwtToken}");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                ),
              ));
        }else{
          Fluttertoast.showToast(msg: res.message);
        }

      }else{
        await initDeviceInfo();
        var res = await httpService.registerAPiModel(name:widget.name,
            email:widget.email,phone:widget.mobileNumber);
        if(res.status == true){
          Fluttertoast.showToast(msg: "Success");
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('session', "1");
          prefs.setString('open_first', '1');
          prefs.setString('userID', res.data.jwtToken);
          prefs.setString('name', res.data.name);
          prefs.setString('mobile', res.data.phone);
          prefs.setString('email', res.data.email);
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                ),
              ));
        }else{
          Fluttertoast.showToast(msg: res.message);
        }

      }
    }else{
      Fluttertoast.showToast(msg: "Please Enter Correct OTP");
    }

  }

  _reSendOtp(){
    Map request_body = {
      "phone": widget.mobileNumber,
    };


  }

  int _start = 45;
  String _currentString = '45';
  bool _countDownDone = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(fountColor),
      appBar: AppBar(
        elevation: 0,
        title: Text("Verify OTP",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color(blueGreyColor),
      ),
      body: Container(
          color: Color(blueGreyColor),
          width: double.infinity,
          height: double.infinity,

          child: new ListView(
            shrinkWrap: true,
            reverse: false,
            children: <Widget>[
              new SizedBox(
                height: 20.0,
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    children: <Widget>[],
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: Text(
                      "Mobile Verification",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "We have sent you a verification code on your mobile +91 " +
                          widget.mobileNumber,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  new Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: new Form(
                          autovalidate: false,
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 20.0),
                                height: 80.0,
                                child: animatingBorders(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              (_countDownDone)
                                  ? Container(
                                child: Column(
                                  children: [
                                    Text("Didn't you receive any code?",style:TextStyle(
                                      fontSize: 16,
                                      color: Color(text_white),
                                    ),),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: _reSendOtp,
                                      child: Text("Resend Code.",style:TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),
                                    )
                                  ],
                                ),
                              )
                                  : Container(
                                child: Center(
                                  child: Text(
                                    "00:" + _currentString,
                                    style: TextStyle(
                                        color: Color(text_white),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 20.0),
                                height: 70.0,
                                child: RaisedButton(
                                  onPressed: _submitOtp,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(80.0)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: loginButtonGradient(),
                                        borderRadius:
                                        BorderRadius.circular(30.0)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 300.0, minHeight: 50.0),
                                      alignment: Alignment.center,
                                      child: _isLoading==true?Container(height:20,width:20,child: CircularProgressIndicator(),):Text(
                                        'SUBMIT',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              )
            ],
          )),
    );
  }
}
