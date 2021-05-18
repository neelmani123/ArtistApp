import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/edit_profile/model/modeleducation/AddEducationModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http ;
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/edit_profile/EditProfileScreen.dart';


class AddEducationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AddEducationScreenState();
  }
  
}
class AddEducationScreenState extends State<AddEducationScreen>{
  final TextEditingController school_name = new TextEditingController();
  final TextEditingController education = new TextEditingController();
  final TextEditingController filled_of_study = new TextEditingController();
  final TextEditingController start_date = new TextEditingController();
  final TextEditingController end_date = new TextEditingController();
  final TextEditingController currently_study_here = new TextEditingController();
  final TextEditingController education_sub_category = new TextEditingController();
  DateTime selectDate = DateTime.now();
  AddEducationModel _user;
  //final picker =
  @override
  void initState(){
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('Add Education',style: TextStyle(color: Colors.black),),
        ),
        body: Container(
            child:ListView(
                children: <Widget>[
                  ListTile(
                      title: Container(
                       height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              //color: Colors.grey,
                              //offset: Offset(1.0, 1.0), //(x,y)
                              blurRadius: 4.0,
                            ),
                          ],
                        //  borderRadius: BorderRadius.circular(10.10),
                          color: Color(blueGreyColor),
                        ),
                        child: Column(
                            children: [
                              Expanded(
                              flex: 5,
                                child: Container(
                                  height: 30,
                                  child: TextField(
                                    controller: school_name,
                                     style: TextStyle(fontSize: 20,color: Colors.black),
                                    decoration: InputDecoration(
                                        //border: InputBorder.none,
                                        labelText: 'Enter your School name',
                                        labelStyle: TextStyle(color:Color(fountColor)),
                                    ),
                                  ),
                                ),
                                 )
                            ]
                        ),
                      )
                  ),
                  ListTile(
                      title: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              //color: Colors.grey,
                              //offset: Offset(1.0, 1.0), //(x,y)
                              blurRadius: 4.0,
                            ),
                          ],
                          // borderRadius: BorderRadius.circular(10.10),
                          color: Color(blueGreyColor),
                        ),
                        child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: 30,
                                  child: TextField(
                                    controller: education,
                                    style: TextStyle(fontSize: 20,color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Enter your Education',
                                      labelStyle: TextStyle(color:Color(fountColor)),
                                    ),
                                  ),
                                ),
                              )
                            ]

                        ),
                      )
                  ),
                  ListTile(
                      title: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              //color: Colors.grey,
                              //offset: Offset(1.0, 1.0), //(x,y)
                              blurRadius: 4.0,
                            ),
                          ],
                          // borderRadius: BorderRadius.circular(10.10),
                          color: Color(blueGreyColor),
                        ),
                        child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: 30,
                                  child: TextField(
                                    controller: filled_of_study,
                                    style: TextStyle(fontSize: 20,color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Enter your filled of study',
                                      labelStyle: TextStyle(color:Color(fountColor)),
                                    ),
                                  ),
                                ),
                              )
                            ]

                        ),
                        ),
                      ),
                  ListTile(
                    title: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            //color: Colors.grey,
                            //offset: Offset(1.0, 1.0), //(x,y)
                            blurRadius: 4.0,
                          ),
                        ],
                        // borderRadius: BorderRadius.circular(10.10),
                        color: Color(blueGreyColor),
                      ),
                      child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 30,
                                child: GestureDetector(
                                  onTap: ()=>_selectDate(context),
                                  child: AbsorbPointer(
                                    child: TextField(
                                      controller:  start_date,
                                      style: TextStyle(fontSize: 20,color: Colors.black),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Enter your start date',
                                        labelStyle: TextStyle(color:Color(fountColor)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]

                      ),
                    ),
                  ),
                  ListTile(
                    title: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            //color: Colors.grey,
                            //offset: Offset(1.0, 1.0), //(x,y)
                            blurRadius: 4.0,
                          ),
                        ],
                        // borderRadius: BorderRadius.circular(10.10),
                        color: Color(blueGreyColor),
                      ),
                      child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 30,
                                child: GestureDetector(
                                  onTap: () =>_selectDate(context),
                                  child: AbsorbPointer(
                                    child: TextField(
                                      controller:  end_date,
                                      style: TextStyle(fontSize: 20,color: Colors.black),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Enter your end date',
                                        labelStyle: TextStyle(color:Color(fountColor)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]
                      ),
                    ),
                  ),

                  ListTile(
                      title: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                            ),
                          ],
                          color: Color(blueGreyColor),
                        ),
                        child:  Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: 30,
                                  child: TextField(
                                    controller:  currently_study_here,
                                    style: TextStyle(fontSize: 20,color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Enter your current study ',
                                      labelStyle: TextStyle(color:Color(fountColor)),
                                    ),
                                  ),
                                ),
                              )
                            ]

                        ),
                      )
                  ),
                  ListTile(
                      title: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                            ),
                          ],
                          color: Color(blueGreyColor),
                        ),
                        child:  Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: 30,
                                  child: TextField(
                                    controller:  education_sub_category,
                                    style: TextStyle(fontSize: 20,color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Enter your education',
                                      labelStyle: TextStyle(color:Color(fountColor)),
                                    ),
                                  ),
                                ),
                              )
                            ]

                        ),
                      )
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 330,
                        margin: const EdgeInsets.only(left: 10.0, top: 20),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.10),),
                          // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                          onPressed: () async{
                            final String name = school_name.text;
                            final String education_= education.text;
                            final String filled= filled_of_study.text;
                            final String start=start_date.text;
                            final String end=end_date.text;
                            final String ccurrently=currently_study_here.text;
                            final String education_sub = education_sub_category.text;
                            setState(() {
                              add_education(school_name.text,education.text,filled_of_study.text,start_date.text,end_date.text,currently_study_here.text,education_sub_category.text);
                            });
                            Text("${_user.status}${_user.message}");
                             // Navigator.push(context, MaterialPageRoute(builder: (context) => edit_profile()));
                          },
                          color: Color(fountColor),
                          // textColor: Colors.white,
                          child: Text("Save",
                              style: TextStyle(fontSize: 20,color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ]
            )
        )
    );
  }
  Future<Null> _selectDate(BuildContext context) async {
   final DateTime picked = await showDatePicker(context: context, initialDate: selectDate, firstDate: DateTime(1901,1),lastDate: DateTime(2100));
    // if(picked ! = null && picked ! = selectDate)
    //   setState(() {
    //     selectDate=picked;
    //     DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    //     DateTime dateTime = dateFormat.parse(picker.toString());
    //     start_date.text = DateFomat('dd-MMM-yyyy').format(dateTime);
    //   });
  }

  void add_education(String text, String text2, String text3, String text4, String text5, String text6, String text7) {}
  
}