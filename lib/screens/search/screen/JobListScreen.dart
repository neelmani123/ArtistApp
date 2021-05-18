import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return JobListScreenState();
  }
  
}
class JobListScreenState extends State<JobListScreen>{
  HttpService _httpService = HttpService();

  Future<void> callApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.search_job(jwtToken:prefs.getString('userID'));
    if(res.status == true){
      setState(() {

      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");

    }
  }


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
  
}