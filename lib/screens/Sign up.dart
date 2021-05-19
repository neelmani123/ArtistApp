import 'package:flutter/material.dart';
import 'Color.dart';

class Signup extends StatelessWidget {
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
                        TextField(decoration: InputDecoration(
                          border:  OutlineInputBorder(
                          ),
                          hintText: ' Name',
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
                    child: TextField(decoration: InputDecoration(
                      border:  OutlineInputBorder(),
                      hintText: 'Email',
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
                    child: TextField(decoration: InputDecoration(
                      border:  OutlineInputBorder(),
                      hintText: 'Number',
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
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => Otp()));
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
