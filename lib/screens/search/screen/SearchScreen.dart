import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/search/model/city_list/Data.dart';
import 'package:artist_icon/screens/search/model/skills/Data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends  State<SearchScreen> {
  HttpService _httpService = HttpService();
  List<DataSkills> _skills=[];
  var _items=null;
  List<DataSkills> _selectedskills3 = [];
  final _skillsSelectKey = GlobalKey<FormFieldState>();

  List<DataCity> citydata=[];
  var _itemsCity=null;
  List<DataCity> _selectedCity = [];
  final _citySelectKey = GlobalKey<FormFieldState>();

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


@override
void initState() {
  _selectedJobs = _jobTypes;
  super.initState();
  skills_listApi();
  city_listApi();
}

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

  Future<void> city_listApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.city_list(jwtToken:prefs.getString('userID'),limit:"");
    if(res.status == true){
      setState(() {
        citydata=  res.data;
        _itemsCity = citydata
            .map((citys) => MultiSelectItem<DataCity>(citys, citys.city))
            .toList();
      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");

    }
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Search"),
    ),
    body: SingleChildScrollView(
      child: Container(

        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[

            SizedBox(height: 10),
            MultiSelectBottomSheetField<DataSkills>(
              key: _skillsSelectKey,
              initialChildSize: 0.7,
              maxChildSize: 0.95,
              title: Text("Skills"),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Color(boldColor),
                  width: 1,
                ),
              ),
              buttonIcon: Icon(
                Icons.shopping_bag,
                color: Colors.black54,
              ),
              buttonText: Text(
                "Skills",
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
                  });
                  _skillsSelectKey.currentState.validate();
                },
              ),
            ),

            SizedBox(height: 40),
            MultiSelectBottomSheetField<DataCity>(
              key: _citySelectKey,
              initialChildSize: 0.7,
              maxChildSize: 0.95,
              title: Text("Location"),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Color(boldColor),
                  width: 1,
                ),
              ),
              buttonIcon: Icon(
                Icons.shopping_bag,
                color: Colors.black54,
              ),
              buttonText: Text(
                "Location",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              items: _itemsCity,
              searchable: true,
              validator: (values) {
                if (values == null || values.isEmpty) {
                  return "Required";
                }
                List<String> names = values.map((e) => e.city).toList();
                if (false) {
                }
                return null;
              },
              onConfirm: (values) {
                setState(() {
                  _selectedCity = values;
                });
                _citySelectKey.currentState.validate();
              },
              chipDisplay: MultiSelectChipDisplay(
                chipColor:Color(boldColor),
                textStyle: TextStyle(fontSize: 14,color: Color(text_white)),
                onTap: (item) {
                  setState(() {
                    _selectedCity.remove(item);
                  });
                  _citySelectKey.currentState.validate();
                },
              ),
            ),

            SizedBox(height: 40),
            MultiSelectBottomSheetField<JobType>(
              key: _multiSelectKey,
              initialChildSize: 0.7,
              maxChildSize: 0.95,
              title: Text("Job Types"),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Color(boldColor),
                  width: 1,
                ),
              ),
              buttonIcon: Icon(
                Icons.shopping_bag,
                color: Colors.black54,
              ),
              buttonText: Text(
                "Job Types",
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
                textStyle: TextStyle(fontSize: 14,color: Color(text_white)),
                onTap: (item) {
                  setState(() {
                    _selectedJobs.remove(item);
                  });
                  _multiSelectKey.currentState.validate();
                },
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
                      _appl_now(context);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                    },
                    color: Color(boldColor),
                    textColor: Colors.white,
                    child: Text("Apply Now",
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

  void _appl_now(BuildContext context) {

   List<String> selectedskills=[];
   List<String> locations=[];
   List<String> jobTypes=[];
  for(int i=0;i<_selectedskills3.length;i++){
    selectedskills.add(_selectedskills3[i].id);
  }
   for(int i=0;i<_selectedCity.length;i++){
     locations.add(_selectedCity[i].id);
   }
   for(int i=0;i<_selectedJobs.length;i++){
     jobTypes.add(_selectedJobs[i].id.toString());
   }

   String skills = selectedskills.join(',');
   String location = locations.join(',');
   String jobs = jobTypes.join(',');
   print(skills+"==="+location+"===="+jobs);
  }

}

class JobType {
  final int id;
  final String name;

  JobType({
    this.id,
    this.name,
  });
}