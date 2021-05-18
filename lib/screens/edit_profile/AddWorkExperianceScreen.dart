import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddWorkExperianceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddWorkExperianceScreenState();
  }
}

class AddWorkExperianceScreenState extends State<AddWorkExperianceScreen> {
  bool _isLoading = true;
  final TextEditingController position = new TextEditingController();
  final TextEditingController company_name = new TextEditingController();
  final TextEditingController start_date = new TextEditingController();
  final TextEditingController end_date = new TextEditingController();
  final TextEditingController current_work = new TextEditingController();
  final TextEditingController location = new TextEditingController();
  HttpService _httpService = HttpService();
  _addData() async {
    var res = await _httpService.add_Work_exp(
        position: position.text,
        comp_name: company_name.text,
        start_date: "2015-10-12",
        end_date: "2014-10-29",
        current_work: current_work.text,
        location: 'noida');
    if (res.status == true) {
      setState(() {
        _isLoading = false;
      });
      print(res.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Work Experience',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Container(
                width: MediaQuery.of(context).size.width,
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
                    Container(
                        margin: EdgeInsets.only(right: 190, top: 10),
                        child: Text(
                          "Position",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'images/job.png',
                                color: Colors.white,
                              )),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            height: 40,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: position,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Your Designation',
                                  hintStyle: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
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
                    Container(
                        margin: EdgeInsets.only(right: 110, top: 10),
                        child: Text(
                          "Where did you work?",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'images/building.png',
                                color: Colors.white,
                                height: 20,
                                width: 20,
                              )),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            height: 40,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: company_name,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Company Name',
                                  hintStyle: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
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
                    Container(
                        margin: EdgeInsets.only(right: 180, top: 10),
                        child: Text(
                          "start date",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image.asset('images/calendar-alt.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 180,
                            left: 10,
                          ),
                          child: Text(
                            '02-11-2020',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(),
                          child: Image.asset(
                            'images/calendar-alt.png',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Container(
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      //color: Colors.grey,
                      //offset: Offset(1.0, 1.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                  // borderRadius: BorderRadius.circular(10.10),
                  color: Color(boldColor),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        //Container(child: Image.asset(''),),
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            'I currently work here',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 90, top: 10),
                          child: Image.asset('images/dropdown_buttan.png'),
                        ),
                      ],
                    )
                  ],
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
                    Container(
                        margin: EdgeInsets.only(right: 200, top: 10),
                        child: Text(
                          "end date",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image.asset('images/calendar-alt.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 180,
                            left: 10,
                          ),
                          child: Text(
                            '02-11-2020',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(),
                          child: Image.asset(
                            'images/calendar-alt.png',
                          ),
                        ),
                      ],
                    )
                  ],
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
                    Container(
                        margin: EdgeInsets.only(right: 130, top: 10),
                        child: Text(
                          "what did you do?",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'images/home.png',
                                color: Colors.white,
                                height: 20,
                                width: 20,
                              )),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            height: 40,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: location,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Company Location',
                                  hintStyle: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
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
                  width: 330,
                  margin: const EdgeInsets.only(left: 10.0, top: 20),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.10),
                    ),
                    // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      _addData();
                    },
                    color: Color(boldColor),
                    // textColor: Colors.white,
                    child: Text("Save",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
