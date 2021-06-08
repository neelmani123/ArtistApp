import 'package:artist_icon/screens/Color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddInterest extends StatefulWidget {
  @override
  _AddInterestState createState() => _AddInterestState();
}

class _AddInterestState extends State<AddInterest> {
  /*Map<String, bool> values = {
    'Music': true,
    'Dancing': false,
  };*/
  TextEditingController interest_controller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text('Add Interest')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              height: 150,
              child: /*ListView(
                children: values.keys.map((String key) {
                  return new CheckboxListTile(
                    title: Text(key),
                    value: values[key],
                    onChanged: (bool value) {
                      setState(() {
                        values[key] = value;
                        print(values[key]);
                      });
                    },
                  );
                }).toList(),
              ),*/TextFormField(
                controller: interest_controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Add Interest",
                  hintText: "Add Interest",
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
            SizedBox(height: 50,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 20,bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.10),),
                // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () {
                  setState(() async{
                    // _uploadImage();
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString('interest', interest_controller.text);
                    Fluttertoast.showToast(msg: "Update  Successfully");
                  });
                },
                color: Color(fountColor),
                // textColor: Colors.white,
                child: Text("Submit",
                    style: TextStyle(fontSize: 20,color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
