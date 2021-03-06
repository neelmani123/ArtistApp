import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ChangeStatus extends StatefulWidget {
  final String jobId;
  const ChangeStatus({this.jobId,Key key}) : super(key: key);

  @override
  _ChangeStatusState createState() => _ChangeStatusState();
}

class _ChangeStatusState extends State<ChangeStatus> {
  String _radioValue; //Initial definition of radio button value
  String choice;
  bool _isLoading;
  HttpService _httpService = HttpService();

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case '1':
          choice = value;
          break;
        case '2':
          choice = value;
          break;
        case '3':
          choice = value;
          break;
        case '4':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }
  _changeStatus()async
  {
    var res=await _httpService.changeStatus(id: widget.jobId,type: choice);
    if(res.status==true)
      {
       setState(() {
         Fluttertoast.showToast(msg: res.message);
         _isLoading=false;
       });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Status'),),
      body:  Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Radio(
                value: '1',
                groupValue: _radioValue,
                onChanged: radioButtonChanges,
              ),
              Text(
                "Shortlist Application",
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                value: '2',
                groupValue: _radioValue,
                onChanged: radioButtonChanges,
              ),
              Text(
                "Interview ",
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                value: '3',
                groupValue: _radioValue,
                onChanged: radioButtonChanges,
              ),
              Text(
                "selected ",
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                value: '4',
                groupValue: _radioValue,
                onChanged: radioButtonChanges,
              ),
              Text(
                "Not selected",
              ),
            ],
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 20,bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.10),),
              // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
              onPressed: () async{
                setState(() {
                  _isLoading=true;
                  _changeStatus();
                });
              },
              color: Color(fountColor),
              // textColor: Colors.white,
              child: _isLoading==true?Container(height:20,width: 20,child: CircularProgressIndicator(),):Text("POST",
                  style: TextStyle(fontSize: 20,color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
