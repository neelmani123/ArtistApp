import 'package:artist_icon/screens/Color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddInterest extends StatefulWidget {
  @override
  _AddInterestState createState() => _AddInterestState();
}

class _AddInterestState extends State<AddInterest> {
  Map<String, bool> values = {
    'Music': true,
    'Dancing': false,
  };
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text('Add Interest')),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            height: 100,
            child: ListView(
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
              onPressed: () async{
                setState(() {
                  // _uploadImage();
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
    );
  }
}
