import 'dart:convert';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/search/model/city_list/Data.dart';
import 'package:artist_icon/screens/search/model/skills/Data.dart';
import 'package:artist_icon/screens/search/screen/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CreateJobPost extends StatefulWidget {
  const CreateJobPost({Key key}) : super(key: key);

  @override
  _CreateJobPostState createState() => _CreateJobPostState();
}

class _CreateJobPostState extends State<CreateJobPost> {
  List<DropdownMenuItem<String>> listDrop = [];
  List<DropdownMenuItem<String>> listDrop1 = [];
  HttpService _httpService = HttpService();
  List<DataCity> citydata=[];
  String value1;
  String value2 ;
  List<DataSkills> _skills=[];
  var _items=null;
  List<DataSkills> _selectedskills3 = [];
  final _skillsSelectKey = GlobalKey<FormFieldState>();
  TextEditingController location_controller=new TextEditingController();
  TextEditingController title_controller=new TextEditingController();
  TextEditingController company_name_controller=new TextEditingController();
  TextEditingController other_skill_controller=new TextEditingController();
  TextEditingController salary_form_controller=new TextEditingController();
  TextEditingController salary_to_controller=new TextEditingController();
  TextEditingController exp_from_controller=new TextEditingController();
  TextEditingController exp_to_controller=new TextEditingController();
  TextEditingController job_type_controller=new TextEditingController();
  TextEditingController working_hours_controller=new TextEditingController();
  TextEditingController city_controller=new TextEditingController();
  TextEditingController job_category_controller=new TextEditingController();
  TextEditingController description_controller=new TextEditingController();
  bool _isLoading;
  static List<JobType> _jobTypes = [
    JobType(id: 1, name: "Full Time"),
    JobType(id: 2, name: "Part Time"),
    JobType(id: 3, name: "Contract"),
    JobType(id: 4, name: "Remote"),
    JobType(id: 5, name: "Freelance"),
  ];
  List<JobType> _selectedJobs = [];
  final _itemsJob = _jobTypes
      .map((jobs) => MultiSelectItem<JobType>(jobs, jobs.name))
      .toList();
  final _multiSelectKey = GlobalKey<FormFieldState>();


  /*Future<void> city_listApi() async {
    print("jhsjhsjhdsjh==========");//jana screen me ab hit karna nahi ho raha hai call
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.city_list(jwtToken:prefs.getString('userID'),limit:"");
    if(res.status == true){
      setState(() {
        print(res.data.first);
        citydata=  res.data;
        var _itemsCity = citydata;
        for(int i=0;i<_itemsCity.length;i++)
          {
            *//*listDrop.add(new DropdownMenuItem(
              child: new Text(
                _itemsCity[i]['city'],
              ),
              value: _itemsCity[i]['id'],
            ));*//*
          }

      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");

    }
  }*/
  Future<void> skills_listApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.skills_list(jwtToken:prefs.getString('userID'),limit:"");
    if(res.status == true){
      setState(() {
        _skills=  res.data;
        _items = _skills
            .map((skills) => MultiSelectItem<DataSkills>(skills, skills.skills_name))
            .toList();
      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");

    }
  }

  Future cityName()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'), "limit":""});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Artist_api/city_list",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    var cityes = data["data"] as List;
    print("Status is ${data['status']}");
    listDrop = [];
    if (status == true) {
      setState(() {
        _isLoading=false;
        for (int i = 0; i < cityes.length; i++) {
          listDrop.add(new DropdownMenuItem(
            child: new Text(
              cityes[i]['city'],
            ),
            value: cityes[i]['id'],
          ));
        }
      });
    }
  }
  Future getCategory()async
  {
    final _prefs = await SharedPreferences.getInstance();
    final res = jsonEncode({"jwtToken": _prefs.getString('userID'), "limit":""});
    var response = await http.post(
        "https://artist.devclub.co.in/api/Artist_api/job_categories_list",
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    var cityes = data["data"] as List;
    print("Status is ${data['status']}");
    listDrop1 = [];
    if (status == true) {
      setState(() {
        _isLoading=false;
        for (int i = 0; i < cityes.length; i++) {
          listDrop1.add(new DropdownMenuItem(
            child: new Text(
              cityes[i]['name'],
            ),
            value: cityes[i]['id'],
          ));
        }
      });
    }
  }

  /*_addCreateJobPost() async
  {
    var res=await _httpService.create_job_post(
        category_id: "1",
        location: location_controller.text,
        title:  title_controller.text,
        company_name:  company_name_controller.text,
        experience_from: exp_from_controller.text,
        experience_to: exp_to_controller.text,
        salary_from: salary_form_controller.text,
        salary_to: salary_to_controller.text,
        city_id: "1",
        other_skill: other_skill_controller.text,
        job_description: description_controller.text,
        job_type: job_type_controller.text,
        working_hours: working_hours_controller.text,
    );
    Fluttertoast.showToast(msg: "Create job Successfully.");
    _isLoading=false;
    if(res.status==true)
    {
      _isLoading=false;
      print(res.message);
      //_showScaffold(res.message);
      //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditProfileScreen()));
    }
  }*/
  Future _addCreateJobPost1() async
  {
    final prefs = await SharedPreferences.getInstance();
    Map<String, String>headers = {'Content-Type': 'application/json'};
    Map reqBody = {
      "jwtToken":  prefs.getString('userID'),
      "category_id": job_category_controller.text,
      "location": location_controller.text,
      "title": title_controller.text,
      "job_description": description_controller.text,
      "skills": "1,2",
      "other_skills": other_skill_controller.text,
      "salary_from": salary_form_controller.text,
      "salary_to": salary_to_controller.text,
      "experience_to": exp_to_controller.text,
      "experience_form": exp_to_controller.text,
      "job_type": job_type_controller.text,
      "company_name": company_name_controller.text,
      "working_hours": working_hours_controller.text,
      "city_id": city_controller.text
    };
    var response = await http.post(
        "https://artist.devclub.co.in/api/Artist_api/create_job_post",
        body: jsonEncode(
            {
              "jwtToken": prefs.getString('userID'),
              "category_id": value1,
              "location": location_controller.text,
              "title": title_controller.text,
              "job_description": description_controller.text,
              "skills": "1,2",
              "other_skills": other_skill_controller.text,
              "salary_from": salary_form_controller.text,
              "salary_to": salary_to_controller.text,
              "experience_to": exp_to_controller.text,
              "experience_form": exp_to_controller.text,
              "job_type": "Full time",
              "company_name": company_name_controller.text,
              "working_hours": working_hours_controller.text,
              "city_id": value2
            }
        ));
    Map data = json.decode(response.body);
    print("response is:${data}");
    if(data['status']==true)
      {
        setState(() {
          Fluttertoast.showToast(msg: data['message']);
          _isLoading=false;
        });

      }
  }
        @override
  void initState() {
    // TODO: implement initState
   // city_listApi();
    cityName();
    getCategory();
    skills_listApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Create Job Post",style: TextStyle(fontFamily: 'RobotoSlab'),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Card(
              elevation: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Location',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: location_controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            //prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                        ),
                      ),
                    )

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
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Title',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: title_controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                        ),
                      ),
                    )

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
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Company Name',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: company_name_controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
           Card(
             child: Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:20,top: 10),
                     child: Text('Skills',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                   ),
                   MultiSelectBottomSheetField<DataSkills>(
                     confirmText: Text('Ok',style: TextStyle(color: Color(fountColor)),),
                     cancelText: Text('Cancel',style: TextStyle(color: Color(fountColor)),),
                     checkColor: Colors.black,
                     key: _skillsSelectKey,
                     initialChildSize: 0.7,
                     maxChildSize: 0.95,
                    // title: Text("Skills"),
                     buttonIcon: Icon(
                       Icons.shopping_bag,
                       color: Colors.black54,
                     ),
                     buttonText: Text(
                       "   Skills",
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 16,
                       ),
                     ),
                     items: _items,
                     searchable: true,
                     validator: (values) {
                       if (values == null || values.isEmpty) {
                         return "Required";
                       }
                       List<String> names = values.map((e) => e.skills_name).toList();
                       print("Selected Skill is:${names}");
                       if (false) {
                       }
                       return null;
                     },
                     onConfirm: (values) {
                       setState(() {
                         _selectedskills3 = values;

                       });
                       _skillsSelectKey.currentState.validate();
                     },
                     chipDisplay: MultiSelectChipDisplay(
                       chipColor:Color(boldColor),
                       textStyle: TextStyle(fontSize: 14,color: Color(text_white)),
                       onTap: (item) {
                         setState(() {
                           _selectedskills3.remove(item);
                           //print("Selected Skill is:${_selectedskills3}");
                         });
                         _skillsSelectKey.currentState.validate();
                       },
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
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Other Skills',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: other_skill_controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                        ),
                      ),
                    )

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
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Salary From',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: salary_form_controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                        ),
                      ),
                    )

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
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Salary To',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: salary_to_controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                        ),
                      ),
                    )

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
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Experience From',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: exp_from_controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                        ),
                      ),
                    )

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
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Experience To',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: exp_to_controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Job Type',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    MultiSelectBottomSheetField<JobType>(
                      confirmText: Text('Ok',style: TextStyle(color: Color(fountColor)),),
                      cancelText: Text('Cancel',style: TextStyle(color: Color(fountColor)),),
                      checkColor: Colors.black,
                      key: _multiSelectKey,
                      initialChildSize: 0.7,
                      maxChildSize: 0.95,
                     // title: Text("Job Types"),
                      buttonIcon: Icon(
                        Icons.shopping_bag,
                        color: Colors.black54,
                      ),
                      buttonText: Text(
                        "   Job Type",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      items: _itemsJob,
                      searchable: true,
                      validator: (values) {
                        if (values == null || values.isEmpty) {
                          return "Required";
                        }
                        List<String> names = values.map((e) => e.name).toList();
                        print("Names${names}");
                        if (false) {

                        }
                        return null;
                      },
                      onConfirm: (values) {
                        setState(() {
                          _selectedJobs = values;
                        });
                        _multiSelectKey.currentState.validate();
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        chipColor:Color(boldColor),
                        textStyle: TextStyle(fontSize: 14,color: Colors.black),
                        onTap: (item) {
                          setState(() {
                            _selectedJobs.remove(item);
                          });
                          _multiSelectKey.currentState.validate();
                        },
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
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Working hours',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: working_hours_controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
            Card(child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10),
                    child: Text('Select City',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: value2,
                        hint: Text(
                          ' Select City',
                          style: TextStyle(color: Colors.black),
                        ),
                        items: listDrop,
                        iconSize: 30.0,
                        elevation: 16,
                        iconEnabledColor: Colors.black,
                        onChanged: (val) {
                          setState(() {
                            value2 = val;
                            print(value2);
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),),
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
              child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10),
                    child: Text('Category Type',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: value1,
                        hint: Text(
                          ' Category Type',
                          style: TextStyle(color: Colors.black),
                        ),
                        items: listDrop1,
                        iconSize: 30.0,
                        elevation: 16,
                        iconEnabledColor: Colors.black,
                        onChanged: (val) {
                          setState(() {
                            value1 = val;
                            print(value1);
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),),
            Card(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('Description',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 17,color: Color(fountColor)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: description_controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
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
                    _isLoading=true;
                    //_addCreateJobPost();
                    _addCreateJobPost1();

                  });
                },
                color: Color(fountColor),
                // textColor: Colors.white,
                child: _isLoading==true?Container(height:20,width: 20,child: CircularProgressIndicator(),):Text("POST",
                    style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'RobotoSlab')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

