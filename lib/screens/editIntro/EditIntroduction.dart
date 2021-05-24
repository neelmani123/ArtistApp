import 'dart:convert';

import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/profile/ProfileScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class EditIntroduction extends StatefulWidget {
  @override
  _EditIntroductionState createState() => _EditIntroductionState();
}

class _EditIntroductionState extends State<EditIntroduction> {
  @override
  bool _isLoading;
  //PickedFile _imageFiler;
 // String _imageFiler;
  File _image;
  final formKey = new GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  TextEditingController name_controlle=new TextEditingController();
  TextEditingController contact_controller=new TextEditingController();
  TextEditingController profile_controller=new TextEditingController();
  TextEditingController home_controller=new TextEditingController();
  TextEditingController work_location_controller=new TextEditingController();
  TextEditingController resume_controller=new TextEditingController();
  TextEditingController exp_year_controller=new TextEditingController();
  TextEditingController exp_month_controller=new TextEditingController();
  final TextEditingController _gender = TextEditingController();


  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            "Choose Profile photo",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: Icon(Icons.camera, color: Colors.green),
                onPressed: () {
                  getImage1(ImageSource.camera);
                  Navigator.pop(context);
                },
                label: Text(
                  "Camera",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton.icon(
                icon: Icon(Icons.image, color: Colors.green),
                onPressed: () {
                  getImage1(ImageSource.gallery);
                  Navigator.pop(context);

                },
                label: Text("Gallery",style: TextStyle(color: Colors.black),),
              ),
            ],
          )
        ],
      ),
    );
  }
  Future _uploadImage()async
  {
    _isLoading=true;
    final _prefs = await SharedPreferences.getInstance();
    //String fileName1 = _image.path.split('/').last;
    try {
      FormData formData = new FormData.fromMap({
        "jwtToken": _prefs.getString('userID'),
        /*"profile_img":await  MultipartFile.fromFile(
            _image.path,filename: fileName1),*/
        "name":name_controlle.text,
        "gender":"male",
        "profile_summary":profile_controller.text,
        "skill":"php",
        "home_town":home_controller.text,
        "perfect_work_location":work_location_controller.text,
        "your_interests":"ssr",
        "resume_headline":resume_controller.text,
        "experience_year":exp_year_controller.text,
        "experience_month":exp_month_controller.text,
        "resume":"",
        "profile_img":""
      });
      Response response = await Dio().post(
          "https://artist.devclub.co.in/api/Artist_api/profile_update",
          data: formData);
      print("File Upload Response $response");
      setState(() {
        Fluttertoast.showToast(msg: "Update  Successfully.");
        _isLoading=false;
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ProfileScreen()));
      });
      Map<String,dynamic> data=jsonDecode(response.data);
     // var result=data['result'];
      var sms=data['message'];
      print("Result is:${sms}");
      /*if(result=="success")
      {
        setState(() {
          isLoading=false;
          _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(sms)));
        });
      }*/
    } catch (e) {
      print("Exception caught $e");
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EditIntro'),
      ),
      body: _isLoading==true?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: Container(
          child: Form(
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          radius: 52,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                              radius: 50,
                              backgroundImage: _image == null
                                  ? NetworkImage("")
                                  : Image.file(_image,width: 50,height: 50,)),
                        ),
                      ),
                      Positioned(
                        right: 1,
                        bottom: 10,
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                builder: (builder) => bottomSheet());
                          },
                          child: Container(
                            child: Icon(Icons.edit),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: name_controlle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Your Full Name",
                      hintText: "Your Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          int selectedRadio;
                          return AlertDialog(
                            title: Text(
                              'Select Gender', textAlign: TextAlign.center,),
                            content: StatefulBuilder(
                                builder: (BuildContext context,StateSetter setState)
                                {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Radio(value: 0,
                                                    groupValue: selectedRadio,
                                                    onChanged: (val) {

                                                      _gender.text = "Male";
                                                      setState(() => selectedRadio = val,
                                                      );
                                                    }),
                                                Text("Male"),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Radio(value: 1,
                                                    groupValue: selectedRadio,
                                                    onChanged: (val) {
                                                      _gender.text = "Female";
                                                      setState(() => selectedRadio = val);
                                                    }),
                                                Text("Female"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                child: Text("Cancel"),
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            InkWell(
                                              onTap: () {

                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                child: Text("OK"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  );
                                }

                            ),
                          );
                        }
                    );
                  },
                  child: IgnorePointer(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: _gender,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Gender",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color(fountColor),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(fountColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: contact_controller,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Contact Number",
                      hintText: "Contact Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: profile_controller,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Enter profile summary",
                      hintText: "Enter profile summary",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: home_controller,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Home Town",
                      hintText: "Home Town",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: work_location_controller,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Perfect work location ",
                      hintText: "Perfect work location",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: resume_controller,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Resume headline ",
                      hintText: "Resume headline",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: exp_year_controller,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Experience Year",
                      hintText: "Experience Year",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: exp_month_controller,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Experience Month",
                      hintText: "Experience Month",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(fountColor),
                        ),
                      ),
                    ),
                  ),
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
                        _uploadImage();
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
          ),
        ),
      )
    );
  }
  //Here get Image from Camera and Gallery
  void getImage1(source) async {
    File image =  await ImagePicker.pickImage(source: source);
    setState(() {
       _image = image;
       print("Pic Name:${_image}");
    });
  }
}
