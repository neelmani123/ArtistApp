import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/home_page/screen/EducationScreen.dart';
import 'package:artist_icon/screens/profile/LanguageScreen.dart';
import 'package:artist_icon/screens/profile/SkillsScreen.dart';
import 'package:artist_icon/screens/profile/WorkExperienceScren.dart';
import 'package:artist_icon/screens/profile/model/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return ProfileScreenState();
  }
  
}
class ProfileScreenState extends State<ProfileScreen>{
  HttpService _httpService = HttpService();
  bool is_loading=true;
  Data data;
  Future<void> getDataApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.get_profile_data(jwtToken:prefs.getString('userID'));
    if(res.status == true){
      setState(() {
        data=res.data;
       // prefs.setString('name1', data.name);
        prefs.setString('img', data.profile_img);
        //prefs.setString('email', res.data.email);
        is_loading=false;
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
    return (is_loading)?Center(
        child: CupertinoActivityIndicator(radius:22,
        )):SingleChildScrollView(
      child: Container(
        //color: Colors.blueGrey,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Card(
              color: Color( blueGreyColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   /* Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                      ],
                    ),*/
                    Stack(
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
                         Container(
                           padding: EdgeInsets.only(top: 180,left: 10),
                           child: CircleAvatar(
                             backgroundColor: Color(fountColor),
                             radius: 50,
                             child: CircleAvatar(
                               radius: 45,
                               backgroundImage: NetworkImage(data.profile_img??''),
                             )
                           ),
                         )
                      ],
                    ),
                    SizedBox(width: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name??'',style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoSlab'
                          ),),

                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment : Alignment.topLeft,
                          child: Text(data.profile_summary??'',style: TextStyle(
                          fontSize: 16,
                          color:Colors.grey,
                          fontFamily: 'RobotoSlab',

                        ),),
                      ),
                    ),
                    SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment : Alignment.topLeft,
                        child: Row(
                          children: [
                            Text(data.home_town??'',style: TextStyle(
                              fontSize: 17,
                                color:Color(0xFFa6a6a6),
                              fontFamily: 'RobotoSlab',
                            ),),
                            Text(data.country??'',style: TextStyle(
                              fontSize: 17,
                                color:Color(0xFFa6a6a6),
                              fontFamily: 'RobotoSlab'
                            ),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment : Alignment.topLeft,
                        child: Text(data.email??'',style: TextStyle(
                          fontSize: 17,
                          color:Colors.grey,
                          fontFamily: 'RobotoSlab'
                        ),),
                      ),
                    ),
                    SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment : Alignment.topLeft,
                        child: Text(data.phone??'',style: TextStyle(
                          fontSize:17,
                          color:Colors.grey,
                          fontFamily: 'RobotoSlab'
                        ),),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              color: Color( blueGreyColor),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Align(
                      alignment : Alignment.topLeft,
                      child: Row(
                        children: [
                          Text("Res",style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            fontFamily: 'RobotoSlab',
                            color:Color(rec_job_heading),
                          ),),
                          Text("ume Headline",style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            color:Color(rec_job_heading),
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment : Alignment.topLeft,
                        child: Text(data.resume_headline??'',style: TextStyle(
                          fontSize: 14,
                          color:Colors.black,
                          fontFamily: 'RobotoSlab'
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              color: Color( blueGreyColor),
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
                            fontFamily: 'RobotoSlab',
                            decoration: TextDecoration.underline,
                            color:Color(fountColor),
                          ),),
                          Text("date Resume",style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            color:Color(fountColor),
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment : Alignment.topLeft,
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
                          child: Text(data.resume??'',
                            style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            color:Color(fountColor),
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              color: Color(blueGreyColor),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [

                    Align(
                      alignment : Alignment.topLeft,
                      child: Row(
                        children: [
                          Text("Wo",style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            decoration: TextDecoration.underline,
                            color:Color(rec_job_heading),
                          ),),
                          Text("rk Experience",style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            color:Color(rec_job_heading),
                          ),),
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
                  ],
                ),
              ),
            ),



            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              color: Color(blueGreyColor),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [

                    Align(
                      alignment : Alignment.topLeft,
                      child: Row(
                        children: [
                          Text("Edu",style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            fontFamily: 'RobotoSlab',
                            color:Color(rec_job_heading),
                          ),),
                          Text("cation ",style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            color:Color(rec_job_heading),
                          ),),
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
                  ],
                ),
              ),
            ),


            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              color: Color(blueGreyColor),
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
                            fontFamily: 'RobotoSlab',
                          ),),
                          Text("ills",style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
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
                  ],
                ),
              ),
            ),


            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              color: Color(blueGreyColor),
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
                            fontFamily: 'RobotoSlab',
                            decoration: TextDecoration.underline,
                            color:Color(rec_job_heading),
                          ),),
                          Text("guages",style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
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
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Card(
              color: Color(blueGreyColor),
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
                            fontFamily: 'RobotoSlab',
                          ),),
                          Text("r interests",style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            color:Color(rec_job_heading),
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment : Alignment.topLeft,
                      child: Text(data.your_interests??'',style: TextStyle(
                        fontSize: 15,
                        color:Colors.black,
                        fontFamily: 'RobotoSlab',
                      ),),
                    ),
                  ],
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
  
}