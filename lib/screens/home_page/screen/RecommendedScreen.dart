import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/cached_image.dart';
import 'package:artist_icon/screens/home_page/model/Data.dart';

import 'package:flutter/material.dart';

class RecommendedScreen extends StatefulWidget{
  List<Data> job_categories_list=[];
  RecommendedScreen({Key key, this.job_categories_list}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return AllCollectionsState();
  }

}
class AllCollectionsState extends State<RecommendedScreen>{



  @override
  void initState() {
    super.initState();
  }

  buildItem(BuildContext context, int index) {
    return InkWell(
      child: Column(
        children: [
          Card(

            child: Container(
              height: 220,
              width: 200,
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Center(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                              color: Color(rec_job_bg),
                                      // Set border width
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30.0)),
                                      // Set rounded corner radius
                              ),
                                    alignment: Alignment.topLeft,
                                    margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8,bottom: 8),
                                        child: Text(
                                          "  "+'${widget.job_categories_list[index].job_type??''}', maxLines: 1,overflow: TextOverflow.ellipsis,
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
                          "  "+'${widget.job_categories_list[index].title}', maxLines: 1,overflow: TextOverflow.ellipsis,
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
                                        url: widget.job_categories_list[index].img,
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
                                      "  "+getDate(widget.job_categories_list[index].created_at)+" day ago", maxLines: 1,overflow: TextOverflow.ellipsis,
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
            color: Colors.transparent,
            alignment: Alignment.topLeft,
            margin: new EdgeInsets.symmetric(horizontal: 5.0),
            child: Center(
              child: Text(
                "  "+'${widget.job_categories_list[index].name}', maxLines: 1,overflow: TextOverflow.ellipsis,
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
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
      color: Colors.transparent,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0),
              itemCount: widget.job_categories_list.length,
              shrinkWrap: false,
              itemBuilder: (context, index) {
                return buildItem(context, index);
              },

            ),

          ),
        ],
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
