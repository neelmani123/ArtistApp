import 'dart:convert';

import 'package:artist_icon/screens/Color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddSkill extends StatefulWidget {
  @override
  _AddSkillState createState() => _AddSkillState();
}

class _AddSkillState extends State<AddSkill> {
  /*Map<String, bool> values = {
    'Ballet': true,
    'Ballroom': false,
    'Contemporary': false,
    'Hip Hop.': false,
    'Jazz': false,

  };*/
  bool _isLoading;
  Future _create_post1()async{
    final prefs = await SharedPreferences.getInstance();
    print("Token Is :${prefs.getString('userID')}");
   // Map<String,String>headers={'Content-Type':'application/json'};
    Map reqBody=({
      "jwtToken":prefs.getString('userID'),
      "limit":""
    });
    var response=await http.post("https://artist.devclub.co.in/api/Artist_api/skills_list",body: reqBody);
    Map data=json.decode(response.body);
    print("response is:${data}");
    if (data['status'] == true) {
      setState(() {
        _isLoading = false;
        print(data['message']);
        Fluttertoast.showToast(msg: data['message']);
        /*Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditProfileScreen()));*/
      });
    }
  }
  @override
  void initState() {
    _create_post1();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text('Add Skill')),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            height: 100,
            child: ListView.builder(
              itemCount: 10,
                itemBuilder: (BuildContext ,index){
                return null;
                })
          ),
          SizedBox(height: 50,),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 20,bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.10),),
              // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
              onPressed: () async{
                setState(() {
                  // _uploadImage();
                  Fluttertoast.showToast(msg: "Update  Successfully");
                });
              },
              color: Color(fountColor),
              // textColor: Colors.white,
              child: Text("Submit",
                  style: TextStyle(fontSize: 20,color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
