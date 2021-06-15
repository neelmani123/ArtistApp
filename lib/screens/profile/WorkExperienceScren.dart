import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/cached_image.dart';
import 'package:artist_icon/screens/profile/model/UserWork.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkExperienceScren extends StatefulWidget {
  List<UserWork> job_categories_list = [];
  WorkExperienceScren({Key key, this.job_categories_list}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AllCollectionsState();
  }
}

class AllCollectionsState extends State<WorkExperienceScren> {
  @override
  void initState() {
    super.initState();
  }

  buildItem(BuildContext context, int index) {
    return InkWell(
      child: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Color(blueGreyColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),

                  child: Container(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          color: Colors.transparent,
                           alignment: Alignment.topLeft,
                          margin:
                          new EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // margin: EdgeInsets.only(right: 250,),
                                  child: Image.asset(
                                    'images/logo.png',
                                    color: Color(rec_job_heading),
                                    height: 70,
                                    width: 70,
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 23,top: 10),
                                    child: Text(
                                      '${widget.job_categories_list[index].position}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'RobotoSlab',
                                          color: Colors.black),
                                    ),

                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,top: 10),
                                    color: Colors.transparent,
                                    alignment: Alignment.topLeft,
                                    //margin: new EdgeInsets.symmetric(horizontal: 10,),
                                    child: Text(
                                      '${widget.job_categories_list[index].company_name}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'RobotoSlab',
                                          color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    alignment: Alignment.topLeft,
                                    margin: new EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget.job_categories_list[index].start_date}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 16, fontFamily: 'RobotoSlab',color: Colors.grey),
                                        ),
                                        Text(
                                              '${" " + widget.job_categories_list[index].end_date}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(0),
              itemCount: widget.job_categories_list.length,
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
