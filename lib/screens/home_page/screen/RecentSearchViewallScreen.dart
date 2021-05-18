import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/cached_image.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/home_page/model/Data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchViewallScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecentSearchViewallScreenState();
  }
  
}
class RecentSearchViewallScreenState extends State<RecentSearchViewallScreen>{
  HttpService _httpService = HttpService();
  List<Data> job_categories_list=[];
  Future<void> recent_search_jobApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.recent_search_job(jwtToken:prefs.getString('userID'),limit:"");
    if(res.status == true){
      setState(() {
        job_categories_list=  res.data;
      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");

    }
  }

  buildItem(BuildContext context, int index) {
    return InkWell(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18,right: 10),
            child: Container(
              child: Column(
                children: [
                  Card(
                    color: Color(primarycolor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(card_border_color),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Container(
                                transform: Matrix4.translationValues(-30, 0.0, 0.0),
                                child: IconButton(
                                    iconSize: 50.0,
                                    icon: Icon(Icons.bookmark), onPressed: (
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
                          ),
                          Expanded(
                            flex: 9,
                            child: Container(
                              child: Stack(
                                children: [
                                  Column(
                                    children: <Widget>[

                                      SizedBox(height: 10,),
                                      Container(
                                        child: Align(
                                          alignment : Alignment.topLeft,
                                          child: Text(
                                            "  "+'${job_categories_list[index].job_type??''}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 18,color: Color(rec_job_heading)),
                                          ),
                                        ),
                                      ),

                                      Container(
                                        color: Colors.transparent,
                                        alignment: Alignment.topLeft,
                                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Text(
                                          "  "+'${job_categories_list[index].skills_name}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16,color: Color(text_white)),
                                        ),
                                      ),

                                      Container(
                                        color: Colors.transparent,
                                        alignment: Alignment.topLeft,
                                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Text(
                                          "  "+'${job_categories_list[index].salary_from+"/mo"}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16,color: Color(text_white)),
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
                                                      style: TextStyle(fontSize: 13,color: Color(text_white)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 10,),

                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
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
  void initState() {
    super.initState();
    recent_search_jobApi();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(primarycolor),
      appBar: AppBar(
        backgroundColor: Color(primarycolor),
        title: Text(
          "Recent search",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(0),
        itemCount: job_categories_list.length,
        itemBuilder: (context, index) {
          return buildItem(context, index);
        },

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