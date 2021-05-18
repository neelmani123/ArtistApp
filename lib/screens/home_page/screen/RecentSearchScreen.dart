import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/cached_image.dart';
import 'package:artist_icon/screens/home_page/model/Data.dart';
import 'package:flutter/material.dart';

class RecentSearchScreen extends StatefulWidget{
  List<Data> job_categories_list=[];
  RecentSearchScreen({Key key, this.job_categories_list}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return AllCollectionsState();
  }

}
class AllCollectionsState extends State<RecentSearchScreen>{



  @override
  void initState() {
    super.initState();
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
                               // child: //Image.asset('images/amazon_logo.png',height: 50,width: 50,),
                                child:IconButton(
                                    iconSize: 50.0,
                                    icon: Icon(Icons.bookmark,color: Colors.white,),
                                    onPressed: (){
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
                                      Center(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Column(
                                                children: [
                                                  Container(

                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(top: 8,bottom: 8),
                                                        child: Text(
                                                          "  "+'${widget.job_categories_list[index].job_type??''}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(fontSize: 13,color: Color(rec_job_heading)),
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
                                                child: IconButton(icon: Icon(Icons.bookmark,color:Colors.white), onPressed: (
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
                                        color: Colors.transparent,
                                        alignment: Alignment.topLeft,
                                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Text(
                                          "  "+'${widget.job_categories_list[index].name}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 22,color: Color(text_white)),
                                        ),
                                      ),

                                      Container(
                                        color: Colors.transparent,
                                        alignment: Alignment.topLeft,
                                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Text(
                                          "  "+'${widget.job_categories_list[index].name}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 22,color: Color(text_white)),
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
                                                      style: TextStyle(fontSize: 13,color: Color(text_white)),
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
