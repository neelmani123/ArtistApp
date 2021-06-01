import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AppliedJobList extends StatefulWidget {
  const AppliedJobList({Key key}) : super(key: key);

  @override
  _AppliedJobListState createState() => _AppliedJobListState();
}

class _AppliedJobListState extends State<AppliedJobList> {
  bool _isLoading=true;
  List data1;

  Future appliedJobList()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID')});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Artist_api/user_applied_list",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    print('Status is:${status}');
    if(status==true)
    {
      setState(() {
        _isLoading=false;
        data1=data['data'];
        Fluttertoast.showToast(msg: data['message']);
        /*Navigator.push(context, MaterialPageRoute(builder: (context)=>AppliedJobList()));*/

      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    appliedJobList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading==true?Container(child: Center(
        child: CircularProgressIndicator(),
      ),):ListView.builder(
        itemCount: data1.length,
          itemBuilder: (BuildContext,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                      child: Row(
                        children: [
                          Text('${data1[index]['company_name']??''}',style: TextStyle(fontWeight: FontWeight.bold),),
                          Spacer(),
                          Icon(Icons.share),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text('${data1[index]['title']??''}',style: TextStyle(color: Colors.black),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text('${data1[index]['location']??''}'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text('Rate:750'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text('Part Time:Monthly Salary'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,)
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

