import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:artist_icon/screens/AddLanguage/addLanguage.dart';
import 'package:artist_icon/screens/AddSkill/addskill.dart';
import 'package:artist_icon/screens/Interest/AddInterest.dart';
import 'package:artist_icon/screens/editIntro/EditIntroduction.dart';
import 'package:artist_icon/screens/edit_profile/AddEducationScreen.dart';
import 'package:artist_icon/screens/edit_profile/AddWorkExperianceScreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/home_page/screen/EducationScreen.dart';
import 'package:artist_icon/screens/profile/LanguageScreen.dart';
import 'package:artist_icon/screens/profile/SkillsScreen.dart';
import 'package:artist_icon/screens/profile/WorkExperienceScren.dart';
import 'package:artist_icon/screens/profile/model/Data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return EditProfileScreenState();
  }

}
class EditProfileScreenState extends State<EditProfileScreen>{
  HttpService _httpService = HttpService();
  final TextEditingController resume_headlines = new TextEditingController();
  Data data;
  bool is_loading=true;
  File file;
  String fileName;
  StateSetter _setState;
  Future<void> getDataApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.get_profile_data(jwtToken:prefs.getString('userID'));
    if(res.status == true){
      setState(() {
        is_loading=false;
        data=res.data;
        resume_headlines.text=data.resume_headline;
      });
    }else{
      is_loading=false;
      Fluttertoast.showToast(msg: "Something went wrong");

    }
  }

  @override
  void initState() {
    super.initState();
    getDataApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: (is_loading)?Center(
          child: CupertinoActivityIndicator(radius:22,
          )):SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Card(
               // color: Color(primarycolor),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                       // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35,
                            child: ClipOval(child: Image.network(data.profile_img??'', height: 60, width: 60, fit: BoxFit.cover,),),
                          ),
                         // SizedBox(width: 10,),

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditIntroduction()));
                            },
                            child: Container(
                              //width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 180,bottom: 30),
                              child: Row(
                               // mainAxisAlignment: MainAxisAlignment.end,
                               // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(icon: Icon(Icons.edit,color: Color(fountColor),)),
                                  Text("Edit",style: TextStyle(
                                    fontSize: 20,
                                    color:Color(fountColor),
                                  ),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(data.name??'',style: TextStyle(
                          fontSize: 20,
                          color:Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment : Alignment.topLeft,
                          child: Text(data.profile_summary??'',style: TextStyle(
                            fontSize: 16,
                            color:Colors.grey,
                          ),),
                        ),
                      ),
                      SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment : Alignment.topLeft,
                          child: Row(
                            children: [
                              Text(data.home_town??'',style: TextStyle(
                                fontSize: 16,
                                color:Colors.grey,
                              ),),
                              Text("${data.country??''}",style: TextStyle(
                                fontSize: 16,
                                color:Colors.grey,
                              ),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment : Alignment.topLeft,
                          child: Text(data.email??'',style: TextStyle(
                            fontSize: 20,
                            color:Colors.grey,
                          ),),
                        ),
                      ),
                      SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment : Alignment.topLeft,
                          child: Text(data.phone??'',style: TextStyle(
                            fontSize: 20,
                            color:Colors.grey,
                          ),),
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
             // SizedBox(height: 10),
              Card(
                //color: Color(primarycolor),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment : Alignment.topLeft,
                            child: Row(
                              children: [
                                Text("Res",style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  //color:Color(rec_job_heading),
                                ),),
                                Text("ume Headline",style: TextStyle(
                                  fontSize: 18,
                                  //color:Color(rec_job_heading),
                                ),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: InkWell(
                                onTap: (){
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) => Container(
                                      height: 500,
                                      child: Scaffold(
                                        body: SingleChildScrollView(
                                          controller: ModalScrollController.of(context),
                                          child: Container(
                                           // color: Colors.white,
                                            height: 500,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Text("Res",style: TextStyle(
                                                          fontSize: 18,
                                                          decoration: TextDecoration.underline,
                                                       //   color:Color(rec_job_heading),
                                                        ),),
                                                        Text("ume Headline",style: TextStyle(
                                                          fontSize: 18,
                                                         // color:Color(rec_job_heading),
                                                        ),),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  new Divider(
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    height: 50,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child:
                                                      TextFormField(
                                                        minLines: 2,
                                                        controller: resume_headlines,
                                                        maxLines: 5,
                                                        keyboardType: TextInputType.multiline,
                                                        decoration: InputDecoration(
                                                          hintText: 'Enter here..',
                                                          hintStyle: TextStyle(
                                                              color: Colors.grey
                                                          ),
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                          ),
                                                        ),),
                                                  ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        //margin: const EdgeInsets.only(left: 0.0, right: 180.0),
                                                        height: 50,
                                                        width: 140,
                                                        margin: EdgeInsets.all(30),
                                                        child: RaisedButton(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10.10),),
                                                          // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                                                          onPressed: () {
                                                            setState(() {
                                                              _update_headline(context);
                                                            });
                                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                                                          },
                                                          color: Color(fountColor),
                                                          textColor: Colors.white,
                                                          child: Text("Save",
                                                              style: TextStyle(fontSize: 20)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    IconButton(icon: Icon(Icons.edit,color: Color(fountColor),)),
                                    Text("Edit",style: TextStyle(
                                      fontSize: 20,
                                      color:Color(fountColor),
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment : Alignment.topLeft,
                        child: Text(data.resume_headline??'',style: TextStyle(
                          fontSize: 14,
                          color:Colors.black,
                        ),),
                      ),
                    ],
                  ),
                ),
              ),

             // SizedBox(height: 10),
              Card(
               // color: Color(primarycolor),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(

                    children: [
                      Align(
                        alignment : Alignment.topLeft,
                        child: Row(
                          children: [
                            Text("Up",style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              color:Color(rec_job_heading),
                            ),),
                            Text("date Resume",style: TextStyle(
                              fontSize: 18,
                              color:Color(rec_job_heading),
                            ),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment : Alignment.topLeft,
                        child: InkWell(
                          onTap: () async {
                            FilePickerResult result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['jpg', 'pdf', 'doc'],
                            );

                            if(result != null) {

                              file = File(result.files.single.path);
                              Uint8List fileBytes = result.files.first.bytes;
                              fileName = result.files.first.name;
                              print("File Name is1 :${fileName}");
                            } else {
                              // User canceled the picker
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              border: Border.all(
                                color: Color(fountColor),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                         fileName??'',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color:Colors.black,
                                        ),),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: IconButton(icon: Icon(Icons.upload_sharp,color: Color(fountColor),))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             // SizedBox(height: 10),
              Card(
               // color: Color(primarycolor),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment : Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Wo",style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  color:Color(rec_job_heading),
                                ),),
                                Text("rk Experience",style: TextStyle(
                                  fontSize: 18,
                                  color:Color(rec_job_heading),
                                ),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(icon: Icon(Icons.edit,color: Color(fountColor),)),
                                  Text("Edit",style: TextStyle(
                                    fontSize: 20,
                                    color:Color(fountColor),
                                  ),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment : Alignment.topLeft,
                        child:  Container(
                            child: WorkExperienceScren(job_categories_list:data.user_work)
                        ),
                      ),

                      Align(
                        alignment : Alignment.centerRight,
                        child: Container(
                          height: 30,
                          width: 70,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            //color: Color(primarycolor),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              color: Color(fountColor),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddWorkExperianceScreen(
                                      ),
                                    ));
                              },
                              child: Text(" + Add",
                                  style: TextStyle(fontSize: 16,color: Color(fountColor))),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
              Card(
                //color: Color(primarycolor),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Align(
                        alignment : Alignment.topLeft,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text("Edu",style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  color:Color(rec_job_heading),
                                ),),
                                Text("cation ",style: TextStyle(
                                  fontSize: 18,
                                  color:Color(rec_job_heading),
                                ),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 100),
                              child: Row(
                                children: [
                                  IconButton(icon: Icon(Icons.edit,color: Color(fountColor),)),
                                  Text("Edit",style: TextStyle(
                                    fontSize: 20,
                                    color:Color(fountColor),
                                  ),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment : Alignment.topLeft,
                        child:  Container(
                            child: EducationScreen(job_categories_list:data.user_education)
                        ),
                      ),

                      Align(
                        alignment : Alignment.centerRight,
                        child: Container(
                          height: 30,
                          width: 70,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            //color: Color(primarycolor),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              color: Color(fountColor),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddEducationScreen(
                                      ),
                                    ));
                              },
                              child: Text(" + Add",
                                  style: TextStyle(fontSize: 16,color: Color(fountColor))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
               // color: Color(primarycolor),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [

                      Align(
                        alignment : Alignment.topLeft,
                        child: Row(
                          children: [
                            Text("Sk",style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              color:Color(rec_job_heading),
                            ),),
                            Text("ills",style: TextStyle(
                              fontSize: 18,
                              color:Color(rec_job_heading),
                            ),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment : Alignment.topLeft,
                        child:  Container(
                            child: SkillsScreen(job_categories_list:data.skills_name)
                        ),
                      ),
                      Align(
                        alignment : Alignment.centerRight,
                        child: Container(
                          height: 30,
                          width: 70,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                           // color: Color(primarycolor),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              color: Color(fountColor),
                              width: 1,
                            ),
                          ),
                          child: InkWell(
                            onTap: (){
                              print("Skill Click");
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AddSkill()));
                            },
                            child: Center(
                              child: Text(" + Add",
                                  style: TextStyle(fontSize: 16,color: Color(fountColor))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 10),
              Card(
                //color: Color(primarycolor),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [

                      Align(
                        alignment : Alignment.topLeft,
                        child: Row(
                          children: [
                            Text("Lan",style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              color:Color(rec_job_heading),
                            ),),
                            Text("guages",style: TextStyle(
                              fontSize: 18,
                              color:Color(rec_job_heading),
                            ),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment : Alignment.topLeft,
                        child:  Container(
                            child: LanguageScreen(job_categories_list:data.user_languages)
                        ),
                      ),
                      Align(
                        alignment : Alignment.centerRight,
                        child: Container(
                          height: 30,
                          width: 70,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                           // color: Color(primarycolor),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              color: Color(fountColor),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: (){
                                print("Language Tab Click ");
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Addlanguage()));
                              },
                              child: Text(" + Add",
                                  style: TextStyle(fontSize: 16,color: Color(fountColor))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
              Card(
                //color: Color(primarycolor),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [

                      Align(
                        alignment : Alignment.topLeft,
                        child: Row(
                          children: [
                            Text("You",style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              color:Color(rec_job_heading),
                            ),),
                            Text("r interests",style: TextStyle(
                              fontSize: 18,
                              color:Color(rec_job_heading),
                            ),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment : Alignment.topLeft,
                        child: Text(data.your_interests??'',style: TextStyle(
                          fontSize: 16,
                          color:Color(text_white),
                        ),),
                      ),

                      Align(
                        alignment : Alignment.centerRight,
                        child: Container(
                          height: 30,
                          width: 70,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            //color: Color(primarycolor),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              color: Color(fountColor),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AddInterest()));
                              },
                              child: Text(" + Add",
                                  style: TextStyle(fontSize: 16,color: Color(fountColor))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  Future<void> _update_headline(BuildContext context) async {
    var res = await _httpService.uploadHeadline(resume_headlines.text);
    if(res.status == true){
      setState(() {
        setState(() {
          Navigator.pop(context);
        });
      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");
      Navigator.pop(context);
    }
  }

}