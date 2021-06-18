import 'dart:convert';

import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/search/model/skills/Data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddSkill extends StatefulWidget {
  @override
  _AddSkillState createState() => _AddSkillState();
}

class _AddSkillState extends State<AddSkill> {
  /*Map<String, bool> values = {
    'Ballet': true,
    'Ballroom': false,
    'Contemporary': false,
    'Hip Hop.': false,
    'Jazz': false,

  };*/
  bool _isLoading;
  Future _create_post1()async{
    final prefs = await SharedPreferences.getInstance();
    print("Token Is :${prefs.getString('userID')}");
   // Map<String,String>headers={'Content-Type':'application/json'};
    Map reqBody=({
      "jwtToken":prefs.getString('userID'),
      "limit":""
    });
    var response=await http.post("https://artist.devclub.co.in/api/Artist_api/skills_list",body: reqBody);
    Map data=json.decode(response.body);
    print("response is:${data}");
    if (data['status'] == true) {
      setState(() {
        _isLoading = false;
        print(data['message']);
        Fluttertoast.showToast(msg: data['message']);
        /*Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditProfileScreen()));*/
      });
    }
  }
  HttpService _httpService = HttpService();
  List<DataSkills> _skills=[];
  var _items=null;
  final _skillsSelectKey = GlobalKey<FormFieldState>();
  List<DataSkills> _selectedskills3 = [];
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
  @override
  void initState() {
    _create_post1();
    skills_listApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text('Add Skill')),
      body: Column(
        children: [
          SizedBox(height: 40,),
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

        ],
      ),
    );
  }
}
