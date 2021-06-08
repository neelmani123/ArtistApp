import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePost extends StatefulWidget {
  const SharePost({Key key}) : super(key: key);

  @override
  _SharePostState createState() => _SharePostState();
}

class _SharePostState extends State<SharePost> {
  PickedFile _imageFiler;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading;
  String name1;
  String imageUrl="";

  TextEditingController mind_controller=new TextEditingController();
  //Here get Image from Camera and Gallery
  Future getImage1(source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFiler = pickedFile;
      print("Pic Name:${File(_imageFiler.path)}");
    });
  }

  Future _uploadImage()async
  {
    _isLoading=true;
    final _prefs = await SharedPreferences.getInstance();
    String fileName1 = _imageFiler.path.split('/').last;
    try {
      FormData formData = new FormData.fromMap({
        "jwtToken": _prefs.getString('userID'),
        "file_url":await  MultipartFile.fromFile(
            _imageFiler.path,filename: fileName1),
        "text":mind_controller.text,
        "media_type":"1",
      });
      Response response = await Dio().post(
          "https://artist.devclub.co.in/api/Feed_api/add_feed",
          data: formData,);
      print("File Upload Response $response");
      Map<String, dynamic> data = new Map<String, dynamic>.from(json.decode(response.toString()));
      var result=data['status'];
      if(data['status']==true)
      {
        setState(() {
          _isLoading=false;
          Fluttertoast.showToast(msg: data['message']);
        });
      }
    } catch (e) {
      print("Exception caught $e");
    }
  }

  Future getData()async
  {
    final _prefs = await SharedPreferences.getInstance();
    name1=_prefs.get("name");
    print("Name is:${name1}");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF32353c),
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Color(0xFF32353C),
          //backgroundColor: Colors.grey,
          title: Text('Share Post'),
         flexibleSpace:  Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(
                 Radius.circular(20.0) //                 <--- border radius here
             ),
           ),
           padding: EdgeInsets.only(left:250,right: 20,top: 60),
           child: RaisedButton(
            // color: Colors.grey,
             onPressed: (){
              setState(() {
                _isLoading=true;
                _uploadImage();
              });
             },
             child: Text('Post Upload'),),
         ),
        )
      ),
      body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: Row(
                children: [
                  new Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg"
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Diya Roy',style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 10,top: 10),
              child: TextField(
                controller: mind_controller,
                maxLines: 10,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "What's On Your Mind",
                  hintStyle: TextStyle(
                    color: Colors.white
                  )

                ),
              ),
            ),
            InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (builder) => bottomSheet());
              },
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  /*child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _imageFiler == null
                          ? NetworkImage(imageUrl)
                          : FileImage(File(_imageFiler.path))),*/
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: _imageFiler==null?NetworkImage('https://images.unsplash.com/photo-1547665979-bb809517610d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'):FileImage(File(_imageFiler.path)),
                        fit: BoxFit.cover
                    ) ,
                  ),
                ),
              ),
            ),

          ],
        ),
      )
    );
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

}
