import 'dart:convert';
import 'dart:io';
import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/feed/GetAllFeed.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';

class SharePost extends StatefulWidget {
  const SharePost({Key key}) : super(key: key);

  @override
  _SharePostState createState() => _SharePostState();
}

class _SharePostState extends State<SharePost> {
  PickedFile _imageFiler;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading;
  String name;
  String imageUrl="";
  bool rememberMe = false;
  bool visibilityTag = false;
  bool _validate = false;
  FileType fileType;
  String path;
  var result1=0;

  TextEditingController mind_controller=new TextEditingController();
  TextEditingController price=new TextEditingController();
  TextEditingController title=new TextEditingController();
  TextEditingController desc=new TextEditingController();
  TextEditingController validity=new TextEditingController();
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
    String fileName1 = path.split('/').last;
    String videoName1 = videoFile.path.split('/').last;
    try {
      FormData formData = new FormData.fromMap({
        "jwtToken": _prefs.getString('userID'),
        "file_url":await  MultipartFile.fromFile(
            path,filename: fileName1),
        "text":mind_controller.text,
        "media_type":"2",
        "is_tutorial":result1,
        "price":price.text,
        "title":title.text,
        "desc":desc.text,
        "validity":validity.text,
        "product_image":await MultipartFile.fromFile(
            videoFile.path,filename: videoName1),
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
         Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFeed()));
        });
      }
    } catch (e) {
      print("Exception caught $e");
    }
  }
  void _openFile()async
  {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if(result != null) {
      setState(() {
        path = result.files.single.path ;
      });
      print("File Name is:${path}");
    } else {
      // User canceled the picker
    }
  }

  Future get_name() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name=prefs.get('name1');
      imageUrl=prefs.get('img');
    });
    print("Name is${name}");
  }
  VideoPlayerController _controller;
  File videoFile;
  final picker=ImagePicker();

  _pickVideo()async{
    final video=await picker.getVideo(source: ImageSource.camera);
    setState(() {
      videoFile=File(video.path);
      print("VIdeo File name is:${videoFile}");
      _controller=VideoPlayerController.file(videoFile)..initialize().then((_)
      {
        setState(() {
        });
        _controller.play();
      }
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_name();
  }
 getTutorial(bool rememberMe){
    switch(rememberMe)
    {
      case true :
        result1=1;
        print("Result is :${result1}");
        break;
      case false:
        result1=0;
        print("Result is :${result1}");
        break;
    }
    return result1;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(0xFF32353c),
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back,color: Colors.black)),
         // backgroundColor: Color(0xFF32353C),
          //backgroundColor: Colors.grey,
          title: Text('Share Post',style: TextStyle(color: Colors.black),),
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
                if(mind_controller.text.length==0||path==null){
                  Fluttertoast.showToast(msg: "Fill whats on your mind and picture");
                }
                else if(visibilityTag==true)
                  {
                    if(price.text.length==0||title.text.length==0||desc.text.length==0||validity.text.length==0||_controller==null){
                     Fluttertoast.showToast(msg: "Fill All Fields And Video");
              }
                    else
                      {
                        _isLoading=true;
                        _uploadImage();
                      }
                  }
                else
                  {
                    _isLoading=true;
                    _uploadImage();
                  }

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
                            "${imageUrl??''}"
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('${name??''}',style: TextStyle(color: Colors.black),),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10),
              child: TextField(
                controller: mind_controller,
                maxLines: 5,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "What's On Your Mind?",
                  hintStyle: TextStyle(
                    color: Colors.black
                  )

                ),
              ),
            ),
            /*InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (builder) => bottomSheet());
              },
              child:
            ),*/
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width,
              height: 200,
              /*child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _imageFiler == null
                          ? NetworkImage(imageUrl)
                          : FileImage(File(_imageFiler.path))),*/
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: path==null?NetworkImage(''):FileImage(File(path)),
                    fit: BoxFit.cover
                ) ,
              ),
            ),
        Column(
          children: [
          Container(
          height: 100.0,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                "Choose  photo/Video",
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
                    },
                    label: Text(
                      "Camera",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.image, color: Colors.green),
                    onPressed: () {
                      //getImage1(ImageSource.gallery);
                      _openFile();
                     // Navigator.pop(context);

                    },
                    label: Text("Photo/Video",style: TextStyle(color: Colors.black),),
                  ),
                ],
              )
            ],
          ),
        )
          ],
        ),

        Container(
          padding: EdgeInsets.only(left: 5),
          child: Row(
            children: <Widget>[
              new Checkbox(
                  value: rememberMe,
                  activeColor: Colors.green,
                  hoverColor: Color(fountColor),
                  onChanged:(bool newValue){
                    setState(() {
                      rememberMe = newValue;
                      print("Remember is:${rememberMe}");
                    setState(() {
                      if(rememberMe==true)
                        {
                          visibilityTag=true;
                        }else{
                        visibilityTag=false;
                      }
                      getTutorial(rememberMe);
                    });
                    });
                    Text('Make Tutorial ',style: TextStyle(color: Colors.white),);
                  }),
                   Text('Make Tutorial ',style: TextStyle(color: Colors.black),)
            ],
          ),
        ),
            (visibilityTag)?Container(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: price,
                      style: TextStyle(color: Colors.black
                      ),
                      decoration: InputDecoration(
                        hintText: 'Price',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        hintStyle: TextStyle(color: Colors.black),

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: title,
                      style: TextStyle(color: Colors.black
                      ),
                      decoration: InputDecoration(
                        hintText: 'Title',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        hintStyle: TextStyle(color: Colors.black),

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: desc,
                      style: TextStyle(color: Colors.black
                      ),
                      decoration: InputDecoration(
                        hintText: 'Description',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        hintStyle: TextStyle(color: Colors.black),

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: validity,
                      style: TextStyle(color: Colors.black
                      ),
                      decoration: InputDecoration(
                        hintText: 'Validity',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        hintStyle: TextStyle(color: Colors.black),

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        children: [
                          if(videoFile!=null)
                            _controller.value.initialized?AspectRatio(
                              aspectRatio:_controller.value.aspectRatio,
                              child: VideoPlayer(
                                  _controller
                              ),
                            ):Container()
                          else
                          Column(
                            children: [
                              Container(
                                height: 100.0,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Choose Tutorial Video",
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
                                            _pickVideo();
                                            // Navigator.pop(context);

                                          },
                                          label: Text("Video",style: TextStyle(color: Colors.black),),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ]
                    ),
                  ),

                ],
              ),
            ):Container()
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
              TextButton.icon(
                icon: Icon(Icons.video_collection_rounded, color: Colors.green),
                onPressed: () {
                  getImage1(ImageSource.gallery);
                  Navigator.pop(context);

                },
                label: Text("Video",style: TextStyle(color: Colors.black),),
              ),
            ],
          )
        ],
      ),
    );
  }



}
