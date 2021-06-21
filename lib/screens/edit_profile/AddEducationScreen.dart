import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/edit_profile/model/modeleducation/AddEducationModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http ;
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/edit_profile/EditProfileScreen.dart';
import 'package:intl/intl.dart';


class AddEducationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AddEducationScreenState();
  }
  
}
class AddEducationScreenState extends State<AddEducationScreen>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController school_name = new TextEditingController();
  final TextEditingController education = new TextEditingController();
  final TextEditingController filled_of_study = new TextEditingController();
  final TextEditingController start_date = new TextEditingController();
  final TextEditingController end_date = new TextEditingController();
  final TextEditingController currently_study_here = new TextEditingController();
  final TextEditingController education_sub_category = new TextEditingController();
  DateTime _date1 = DateTime.now();
  DateTime _date = DateTime.now();
  String _formatteddate="",_formatteddate1="";
  bool _isLoading;
  AddEducationModel _user;
  HttpService _httpService = HttpService();
  //final picker =
  @override
  void initState(){
    super.initState();
  }
  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
  _addEducation() async{
    var res=await _httpService.add_education(
      school_name: school_name.text,
      education_level: education.text,
      filled_of_study: filled_of_study.text,
      start_date: _formatteddate,
      end_date: _formatteddate1,
      currently_study_here: currently_study_here.text,
      education_sub_category: education_sub_category.text
    );
    if(res.status==true)
      {
        print(res.message);
        //_showScaffold(res.message);
        Fluttertoast.showToast(msg: res.message);
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditProfileScreen()));
      }
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _formatteddate = new DateFormat.yMMMd().format(_date);
    _formatteddate1 = new DateFormat.yMMMd().format(_date1);
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text('Add Education',style: TextStyle(color: Colors.black),),
        ),
        body: Container(
            child:ListView(
                children: <Widget>[
                  SizedBox(height: 10,),
                  Card(
                    elevation: 5,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 47,top: 10),
                            child: Text('School',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                          ),
                          TextFormField(
                            controller: school_name,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                /*prefixIcon: Image.asset(
                                  'images/job.png',
                                  width: 40,
                                  height: 40,
                                  color: Colors.black,
                                )*/
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 47,top: 10),
                            child: Text('Education',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                          ),
                          TextFormField(
                            controller: education,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                               /* prefixIcon: Image.asset(
                                  'images/job.png',
                                  width: 40,
                                  height: 40,
                                  color: Colors.black,
                                )*/
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 47,top: 10),
                            child: Text('Filled of study',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                          ),
                          TextFormField(
                            controller: filled_of_study,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                               /* prefixIcon: Image.asset(
                                  'images/job.png',
                                  width: 40,
                                  height: 40,
                                  color: Colors.black,
                                )*/
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          selectDate(context);
                          print(_formatteddate);
                        });
                      },
                      child: Container(
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 47,top: 10),
                              child: Text('Start Date',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Image.asset(
                                    'images/calendar-alt.png',
                                    width: 40,
                                    height: 40,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:10),
                                  child: Text(
                                    "${_formatteddate} ",
                                    style: TextStyle(color: Colors.black,fontSize: 15),
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  'images/calendar-alt.png',
                                  width: 40,
                                  height: 40,
                                  color: Color(fountColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          selectDate1(context);
                          print(_formatteddate);
                        });
                      },
                      child: Container(
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 47,top: 10),
                              child: Text('End Date',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Image.asset(
                                    'images/calendar-alt.png',
                                    width: 40,
                                    height: 40,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:10),
                                  child: Text(
                                    "${_formatteddate1} ",
                                    style: TextStyle(color: Colors.black,fontSize: 15),
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  'images/calendar-alt.png',
                                  width: 40,
                                  height: 40,
                                  color: Color(fountColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 47,top: 10),
                            child: Text('current study',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                          ),
                          TextFormField(
                            controller: currently_study_here,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                /*prefixIcon: Image.asset(
                                  'images/job.png',
                                  width: 40,
                                  height: 40,
                                  color: Colors.black,
                                )*/
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 47,top: 10),
                            child: Text('What did learn?',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                          ),
                          TextFormField(
                            controller: education_sub_category,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                /*prefixIcon: Image.asset(
                                  'images/job.png',
                                  width: 40,
                                  height: 40,
                                  color: Colors.black,
                                )*/
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 20),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),),
                          // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                          onPressed: () async{
                            setState(() {
                              _addEducation();
                            });
                          },
                          color: Color(fountColor),
                          // textColor: Colors.white,
                          child: _isLoading==true?Container(height:20,width:20,child: CircularProgressIndicator(),):Text("SAVE",
                              style: TextStyle(fontSize: 20,color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,)
                ]
            )
        )
    );
  }
  /*This Method is use for the Date Picker Dialog1*/
  Future<Null> selectDate1(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: _date1,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
    if (_datePicker != null && _datePicker != _date1) {
      setState(() {
        _date1 = _datePicker;
      });
    }
  }
  /*This Method is use for the Date Picker Dialog*/
  Future<Null> selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
      });
    }
  }

}