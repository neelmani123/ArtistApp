import 'package:artist_icon/model/loginOTP/OTPScreen.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/register/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginMobile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginMobileState();
  }
  
}
class LoginMobileState extends State<LoginMobile>{
  HttpService _httpService = HttpService();
  final TextEditingController mobile_number = new TextEditingController();


  _send_otp(BuildContext context) {
    String validate = validateMobile(mobile_number.text);
    if (validate == null) {
      _call_Api();

    }else{
      Fluttertoast.showToast(msg: validate);
    }
  }

  Future<void> _call_Api() async {
    print("===>"+mobile_number.text);
    var res = await _httpService.sendOtpModel(number:mobile_number.text);

    if(res.status == true){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              mobileNumber: mobile_number.text,
              status: "login",
              name: "",
              email: "",
            ),
          ));
    }else{
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterScreen(
              mobileNumber: mobile_number.text,
              status: "login",
              name: "",
              email: "",
            ),
          ));
    }
  }

  String validateMobile(String value) {
    String pattern = r'(^([9876]{1})([0-9]{9})$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Color(blueGreyColor),
        title: Text('Artist Icon',style: TextStyle(color: Colors.black,fontSize: 20),),

      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.30,
              child:   Image.asset('images/dancer.png'),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.30,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Here To Get\n Welcome!',style: TextStyle(color: Color(fountColor),fontSize: 40,fontWeight: FontWeight.bold),),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: TextField(
                          showCursor: false,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "+91",
                            hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 4,
                    child: Container(child:
                    TextField(keyboardType: TextInputType.number,
                        controller: mobile_number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Enter Phone Number",
                          hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        )
                    )
                      ,),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //margin: const EdgeInsets.only(left: 0.0, right: 180.0),
                  height: 70,
                  width: 140,
                  margin: EdgeInsets.all(30),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.10),),
                    // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () {
                      setState(() {
                        _send_otp(context);
                      });
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                    },
                    color: Color(fountColor),
                    textColor: Colors.white,
                    child: Text("Log in",
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
            Container( margin: const EdgeInsets.only(left: 0.0, right: 180.0),
              child: Text('Or Sign In ',style: TextStyle(color: Color(fountColor),fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                    height: 50,
                    width: 50,
                    //color: Colors.black12,
                    child:
                    Image.asset('images/google.png'),),
                  Container(
                    margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                    height: 50,
                    width: 50,
                    // color: Colors.black12,
                    child:
                    Image.asset('images/twitter.png'),),
                  Container(margin: const EdgeInsets.only(left: 0.0,right: 100.0),
                    height: 40,
                    width: 40,
                    //color: Colors.black12,
                    child:Image.asset('images/facebook.png'),
                  )
                  // Image.asset('images/welcome.ico'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}