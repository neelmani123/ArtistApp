import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/home_page/screen/HomeBanner.dart';
import 'package:artist_icon/screens/home_page/screen/JobCategories.dart';
import 'package:artist_icon/screens/home_page/screen/JobViewAllScreen.dart';
import 'package:artist_icon/screens/home_page/screen/RecentSearchScreen.dart';
import 'package:artist_icon/screens/home_page/screen/RecentSearchViewallScreen.dart';
import 'package:artist_icon/screens/home_page/screen/RecommendedJobViewAllScreen.dart';
import 'package:artist_icon/screens/home_page/screen/RecommendedScreen.dart';
import 'package:artist_icon/screens/home_page/template_listModel/Data.dart';
import 'package:artist_icon/screens/search/screen/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/Data.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
  
}
class HomeState extends State<Home>{
  HttpService _httpService = HttpService();
  List<Data> job_categories_list=[];
  List<Data> recent_search_job=[];
  List<Data> recommended_jobs=[];
  List<DataTemp> template_list=[];

  Future<void> job_categories_listApi() async {
    final prefs = await SharedPreferences.getInstance();
    print("Token is ${prefs.getString('userID')}");
    var res = await _httpService.job_categories_list(jwtToken:prefs.getString('userID'),limit:"10",search:"");
    if(res.status == true){
      setState(() {
        job_categories_list=  res.data;
      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");

    }
  }

  Future<void> recent_search_jobApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.recent_search_job(jwtToken:prefs.getString('userID'),limit:"10");
    if(res.status == true){
      setState(() {
        recent_search_job=  res.data;
      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }
  Future<void> recommended_jobsApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.recommended_jobs(jwtToken:prefs.getString('userID'),limit:"10");
    if(res.status == true){
      setState(() {
        recommended_jobs=  res.data;
      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }
  Future<void> template_listApi() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.template_list(jwtToken:prefs.getString('userID'),limit:"10");
    if(res.status == true){
      setState(() {
        template_list=  res.data;
      });
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");

    }
  }
  @override
  void initState() {
    super.initState();
    job_categories_listApi();
    template_listApi();
    recommended_jobsApi();
    job_categories_listApi();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      } ,
      child: Scaffold(
        backgroundColor: Color(blueGreyColor),
        body:SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      "  Lets Search Job, Explore Products",
                      style: TextStyle(color: Colors.grey, fontSize: 18,fontFamily: 'RobotoSlab'),
                    ),
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      color: Color(blueGreyColor),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey,),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.all(12.0),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => SearchScreen(
                                                ),
                                              ));
                                        },
                                        child: Text(" Search",style: TextStyle(color: Colors.grey,fontSize: 16,fontFamily: 'RobotoSlab'),))

                                  ],
                                ),
                                Spacer(),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Color(fountColor)
                                  ),
                                    child: Icon(Icons.search,color: Colors.white,)),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            )),
                      ),
                    ),
                    HomeBanner(all_banners:template_list),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Text(
                                "  Job Categories",
                                style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: 'RobotoSlab'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => JobViewAllScreen(
                                          ),
                                        ));
                                  },
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                        color: Color(boldColor), fontSize: 16,fontFamily: 'RobotoSlab'),
                                  ),
                                ),
                              )

                            ],
                          ),

                          Container(
                              child: JobCategories(job_categories_list:job_categories_list)
                          ),
                        ],
                      ),
                    ),

                    Container(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "  Recommended For you",
                                style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: 'RobotoSlab'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RecommendedJobViewAllScreen(
                                          ),
                                        ));
                                  },
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                        color: Color(boldColor), fontSize: 16,fontFamily: 'RobotoSlab'),
                                  ),
                                ),
                              )

                            ],
                          ),

                          Container(
                              child: RecommendedScreen(job_categories_list:recommended_jobs)
                          ),
                        ],
                      ),
                    ),


                    Container(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "  Recent search",
                                style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: 'RobotoSlab'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RecentSearchViewallScreen(
                                          ),
                                        ));
                                  },
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                        color: Color(boldColor), fontSize: 16),
                                  ),
                                ),
                              )

                            ],
                          ),

                          Container(
                              child: RecentSearchScreen(job_categories_list:recent_search_job)
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),


            ],
          ),
        ),

      ),
    );
  }
  
}