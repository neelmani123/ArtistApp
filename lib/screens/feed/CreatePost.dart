import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class CreatePost extends StatefulWidget {
  const CreatePost({Key key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  HttpService _httpService = HttpService();
  TextEditingController text_controller=TextEditingController();
  TextEditingController title_controller=TextEditingController();
  TextEditingController desc_controller=TextEditingController();
  bool _isLoading;
  File file;
  String fileName;

  /*Future<void> _create_post() async {
    final _prefs = await SharedPreferences.getInstance();
    var res = await _httpService.create_post(text: text_controller.text,title: title_controller.text,desc: desc_controller.text);
    if(res.status == true)
    {
      _isLoading=false;
      print("Message is :${res.message}");
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }*/

  Future _create_post1()async{
    final prefs = await SharedPreferences.getInstance();
    print("Token Is :${prefs.getString('userID')}");
    Map reqBody=({
      "jwtToken":prefs.getString('userID'),
      "text":text_controller.text,
      "media_type":"1",
      "is_tutorial":"1",
      "price":"2000",
      "title":title_controller.text,
      "desc":desc_controller.text,
      "file_url":"IMG_20200804_185303.jpg",
      "product_image":"IMG_20200804_185303.jpg"
    });
    var response=await http.post("https://artist.devclub.co.in/api/Feed_api/add_feed",body: reqBody);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Create Post'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                  color: Color(fountColor)
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:() async{
                        FilePickerResult result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'pdf', 'doc'],
                        );
                        if(result != null) {
                          file = File(result.files.single.path);
                          Uint8List fileBytes = result.files.first.bytes;
                          fileName = result.files.first.name;
                          print("File Name is :${fileName}");
                        } else {
                          // User canceled the picker
                        }
                    },
                        child: Icon(Icons.file_upload,size: 40,color: Colors.grey,)),
                    Text("${fileName}",style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ),
              SizedBox(height: 10,),
             /* Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Color(fountColor)
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.file_upload,size: 40,color: Colors.grey,),
                    Text('Product Name',style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ),*/
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.star_border_outlined),
                  Text(' Text',style: TextStyle(fontSize: 20,color: Color(fountColor)),),
                ],
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(fountColor),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(fountColor),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.star_border_outlined),
                  Text(' Title',style: TextStyle(fontSize: 20,color: Color(fountColor)),),
                ],
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(fountColor),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(fountColor),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.star_border_outlined),
                  Text('Description',style: TextStyle(fontSize: 20,color: Color(fountColor)),),
                ],
              ),
              SizedBox(height: 5),
              Container(
                height:70,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(fountColor),
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(fountColor),
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  print("Tutorial Click now");
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text("add tutorial")
                  ],
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
                     // _uploadImage();
                      _isLoading=true;
                      _create_post1();

                    });

                  },
                  color: Color(fountColor),
                  // textColor: Colors.white,
                  child: _isLoading==true?Container(height:20,width:20,child: CircularProgressIndicator(),):Text("POST",
                      style: TextStyle(fontSize: 20,color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
