import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/cached_image.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/home_page/model/Data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobViewAllScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return JobViewAllScreenState();
  }
  
}
class JobViewAllScreenState extends State<JobViewAllScreen>{
  List<Data> job_categories_list=[];
  HttpService _httpService = HttpService();

  Future<void> job_categories_listApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.job_categories_list(jwtToken:prefs.getString('userID'),limit:"",search:"");
    if(res.status == true){
      setState(() {
        job_categories_list=  res.data;
      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");

    }
  }


  @override
  void initState() {
    super.initState();
    job_categories_listApi();
  }
  var colors = [
    Color(0xFFACDEE5),
    Color(0xFFC8ABCA),
    Color(0xFFF3B0C2),
    Color(0xFFACDEE5),
    Color(0xFFC8ABCA),
    Color(0xFFF3B0C2),
    Color(0xFFACDEE5),
    Color(0xFFC8ABCA),
    Color(0xFFF3B0C2),
  ];

  buildItem(BuildContext context, int index) {
    return InkWell(
      child: Column(
        children: [
          SizedBox(height: 10,),
          Card(
            color: colors[index],
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                        child: new Stack(
                          children: <Widget>[
                            new Positioned(
                                child:Center(
                                  child: InkWell(
                                    onTap: (){
                                    },
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: CachedImage(
                                      height: 130,
                                      width: 130,
                                      shape: BoxShape.rectangle,
                                      url: job_categories_list[index].img,
                                    ),
                                  ),
                                )
                            ),

                          ],
                        )

                    ),

                  ),



                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   margin: new EdgeInsets.symmetric(horizontal: 5.0),
                  //   child: Text(
                  //     '${widget.products[index].description}', maxLines: 1,
                  //     overflow: TextOverflow.ellipsis,
                  //     style: TextStyle(fontSize: 13,color: Colors.grey),
                  //   ),
                  // ),


                ],
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            alignment: Alignment.topLeft,
            margin: new EdgeInsets.symmetric(horizontal: 5.0),
            child: Center(
              child: Text(
                "  "+'${job_categories_list[index].name}', maxLines: 1,overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15,color: Colors.black),
              ),
            ),
          ),
        ],
      ),

      onTap: (){

      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "All Categories",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(0),
        itemCount: job_categories_list.length,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return buildItem(context, index);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1),
        ),

      ),
    );
  }
  
}