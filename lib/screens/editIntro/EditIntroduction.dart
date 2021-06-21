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
  PickedFile _imageFiler;
  final ImagePicker _picker = ImagePicker();
  String imageUrl="";
  final formKey = new GlobalKey<FormState>();
  TextEditingController name_controlle=new TextEditingController();
  TextEditingController contact_controller=new TextEditingController();
  TextEditingController profile_controller=new TextEditingController();
  TextEditingController home_controller=new TextEditingController();
  TextEditingController work_location_controller=new TextEditingController();
  TextEditingController resume_controller=new TextEditingController();
  TextEditingController exp_year_controller=new TextEditingController();
  TextEditingController exp_month_controller=new TextEditingController();
  final TextEditingController _gender = TextEditingController();
//Here get Image from Camera and Gallery
  void getImage1(source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFiler = pickedFile;
      print("Pic Name:${File(_imageFiler.path)}");
    });
  }

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
    String fileName1 = _imageFiler.path.split('/').last;
    try {
      FormData formData = new FormData.fromMap({
        "jwtToken": _prefs.getString('userID'),
        "profile_img":await  MultipartFile.fromFile(
            _imageFiler.path,filename: fileName1),
        "name":name_controlle.text,
        "gender":_gender.text,
        "profile_summary":profile_controller.text,
        "skill":"1,2",
        "home_town":home_controller.text,
        "perfect_work_location":work_location_controller.text,
        "your_interests":_prefs.getString('interest'),
        "resume_headline":resume_controller.text,
        "experience_year":exp_year_controller.text,
        "experience_month":exp_month_controller.text,
        "resume":"",
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
      appBar: AppBar(
        elevation: 0,
        title: Text('Edit Intro',style: TextStyle(color:Colors.black,fontFamily: 'RobotoSlab'),),
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
                        height: 230,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg"
                              ),

                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.white, spreadRadius: 3)
                            ]
                        ),
                        //alignment: Alignment.center,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 180,left: 20),
                            child: CircleAvatar(
                              radius: 52,
                              backgroundColor: Colors.blue,
                              child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: _imageFiler == null
                                      ? NetworkImage(imageUrl)
                                      : FileImage(File(_imageFiler.path))),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 290,
                        bottom: 20,
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                builder: (builder) => bottomSheet());
                          },
                          child: Container(
                            child: Icon(Icons.edit,color: Color(fountColor),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 300,left: 20),
                        child: Text('Profile photo',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'RobotoSlab'),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Card(
                  elevation: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 47,top: 10),
                          child: Text('Your Full Name *',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                        ),
                        TextFormField(
                          controller: name_controlle,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                          ),
                        )
                      ],
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
                              'Select Gender', textAlign: TextAlign.center,style: TextStyle( fontFamily: 'RobotoSlab',),),
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
                                                Text("Male", style: TextStyle(fontFamily: 'RobotoSlab'),),
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
                                                Text("Female", style: TextStyle(fontFamily: 'RobotoSlab'),),
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
                                                child: Text("Cancel", style: TextStyle(fontFamily: 'RobotoSlab'),),
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            InkWell(
                                              onTap: () {

                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                child: Text("OK", style: TextStyle(fontFamily: 'RobotoSlab'),),
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
                  child: Card(
                    elevation: 3,
                    child: IgnorePointer(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 47,top: 10),
                                  child: Text('Gender ',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(Icons.arrow_drop_down,size: 30,),
                                )
                              ],
                            ),
                            TextFormField(
                              controller: _gender,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 47,top: 10),
                          child: Text('Contact Number ',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: contact_controller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_outlined,color: Colors.black,),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 47,top: 10),
                          child: Text('Enter Profile Summary ',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: profile_controller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_outlined,color: Colors.black,),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 47,top: 10),
                          child: Text('Home Town ',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: home_controller,
                          decoration: InputDecoration(
                           border: InputBorder.none,
                            prefixIcon: Icon(Icons.phone_outlined,color: Colors.black,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 47,top: 10),
                          child: Text('Perfect Work Location',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: work_location_controller,
                          decoration: InputDecoration(
                           border: InputBorder.none,
                            prefixIcon: Icon(Icons.location_on,color: Colors.black,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 47,top: 10),
                          child: Text('Resume Headline',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: resume_controller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on,color: Colors.black,),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 47,top: 10),
                          child: Text('Experience Year',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: exp_year_controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.location_on,color: Colors.black,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 47,top: 10),
                          child: Text('Experience Month',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: exp_month_controller,
                          decoration: InputDecoration(
                           border: InputBorder.none,
                            prefixIcon: Icon(Icons.location_on,color: Colors.black,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 20,bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),),
                    // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () async{
                      setState(() {
                        _uploadImage();
                      });

                    },
                    color: Color(fountColor),
                    // textColor: Colors.white,
                    child: _isLoading==true?Container(height:20,width:20,child: CircularProgressIndicator(),):Text("SAVE",
                        style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'RobotoSlab')),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
