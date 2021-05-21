import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/cached_image.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/home_page/model/Data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecommendedJobViewAllScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecommendedJobViewAllScreenState();
  }
  
}
class RecommendedJobViewAllScreenState extends State<RecommendedJobViewAllScreen>{
  List<Data> job_categories_list=[];
  HttpService _httpService = HttpService();

  Future<void> job_categories_listApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.job_categories_list(jwtToken:prefs.getString('userID'),limit:"10",search:"");
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



  buildItem(BuildContext context, int index) {
    return InkWell(
      child: Column(
        children: [
          Card(
            child: Container(
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Center(
                        child: Row(
                          children: [
                            Expanded(
                              //flex: 4,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(rec_job_bg), // Set border width
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)), // Set rounded corner radius
                                    ),
                                    alignment: Alignment.topLeft,
                                    margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8,bottom: 8),
                                        child: Text(
                                          "  "+'${job_categories_list[index].job_type??''}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 13,color: Color(primarycolor)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: IconButton(icon: Icon(Icons.bookmark), onPressed: (
                                    ){
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => CartListScreen(
                                  //       ),
                                  //     ));

                                }),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 120,
                        color: Colors.transparent,
                        alignment: Alignment.topLeft,
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          "  "+'${job_categories_list[index].name}', maxLines: 1,overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 22,color: Color(blackColor)),
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8,bottom: 8),
                                        child:  CachedImage(
                                          shape: BoxShape.rectangle,
                                          url: job_categories_list[index].img,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: Colors.grey,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(

                                alignment: Alignment.topLeft,
                                margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8,bottom: 8),
                                    child: Text(
                                      "  "+getDate(job_categories_list[index].created_at)+" day ago", maxLines: 1,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 13,color: Color(primarycolor)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),


                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.transparent,
            alignment: Alignment.topLeft,
            margin: new EdgeInsets.symmetric(horizontal: 5.0),
            child: Center(
              child: Text(
                "  "+'${job_categories_list[index].name}', maxLines: 1,overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15,color: Color(job_title_color)),
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
      backgroundColor: Color(primarycolor),
      appBar: AppBar(
        backgroundColor: Color(primarycolor),
        title: Text(
          "Recommended For you",
          style: TextStyle(color: Colors.white),
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
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1),
        ),

      ),
    );
  }

  String getDate(String date) {
    final birthday = DateTime.parse(date);
    final date2 = DateTime.now();
    final difference = date2.difference(birthday).inDays;
    return difference.toString();
  }


}