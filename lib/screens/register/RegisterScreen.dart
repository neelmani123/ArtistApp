import 'package:artist_icon/model/loginOTP/OTPScreen.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget{
  final String mobileNumber;
  final String status;
  final String name;
  final String email;
  RegisterScreen({ this.mobileNumber,  this.status,this.name,this.email});

  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}
class RegisterScreenState extends State<RegisterScreen>{
  HttpService _httpService = HttpService();
  final TextEditingController name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController mobile_number = new TextEditingController();

  _send_otp(BuildContext context) {
    bool status=true;
    String validate = validateMobile(mobile_number.text);
    String validateEmai = validateEmail(email.text);
    status=false;
    if (validate==null && validateEmai==null && !name.text.isEmpty) {
      status=true;
      print("===>"+mobile_number.text);
      _call_Api();
    }
    // if(status){
    //   _call_Api();
    // }

  }
  @override
  void initState() {
    super.initState();
    mobile_number.text=widget.mobileNumber;
  }

  Future<void> _call_Api() async {
    print("===>"+mobile_number.text);
    var res = await _httpService.request_otp_for_regester(number:mobile_number.text);
    if(res.status == true){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              mobileNumber: mobile_number.text,
              status: "register",
              name: name.text,
              email: email.text,
            ),
          ));
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
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
      // backgroundColor:   Color(blueGreyColor),
      appBar: AppBar(
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                child: Text(
                  "Lets 'Get Started ",
                  style: TextStyle(color: Color(boldColor),fontSize: 30,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(child: Text('Singing up or login to see our top and latest gadgets and jobs',style: TextStyle(color: Colors.white,fontSize: 20),)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        //color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 4.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.10),
                    color: Colors.white,
                  ),
                    child: Column(
                      children: [
                        TextField(
                          controller: name,
                          decoration: InputDecoration(
                          border:  OutlineInputBorder(
                          ),
                          hintText: 'Enter Name',
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          //color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 4.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                      border:  OutlineInputBorder(),
                      hintText: 'Enter Email-ID',
                    ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          //color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 4.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: mobile_number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                      border:  OutlineInputBorder(),
                      hintText: 'Enter Phone Number',
                    ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:30.0),
                  child: Container(
                    height: 80,
                    width: 300,
                    child: Text('By creating an account,you agree to our teams of service and privercy policy',style: TextStyle(fontSize: 17,color: Colors.white),textAlign: TextAlign.center,),),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //margin: const EdgeInsets.only(left: 0.0, right: 180.0),
                  height: 70,
                  width: 140,
                  margin: const EdgeInsets.only(left: 10.0, right: 0.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.10),),
                    // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () {
                      _send_otp(context);
                    },
                    color: Color(boldColor),
                    // textColor: Colors.white,
                    child: Text("Sign up",
                        style: TextStyle(fontSize: 20,color: Colors.white)),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text('Already have an account?',style: TextStyle(fontSize:20,color: Colors.white),
                    ),
                  ),
                ),
                Container(child: Text('Or login',style: TextStyle(fontSize: 20,color: Color(boldColor)),),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 0.0, right: 20.0),
                    height: 50,
                    width: 50,
                    //color: Colors.black12,
                    child:
                    Image.asset('images/google.png'),),
                  Container(
                    margin: const EdgeInsets.only(left: 0.0, right: 20.0),
                    height: 40,
                    width: 40,
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