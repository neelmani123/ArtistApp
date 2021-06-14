import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/api_helper/cached_image.dart';
import 'package:artist_icon/screens/home_page/model/Data.dart';
import 'package:flutter/material.dart';

class JobCategories extends StatefulWidget{
  List<Data> job_categories_list=[];
  JobCategories({Key key, this.job_categories_list}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return AllCollectionsState();
  }

}
class AllCollectionsState extends State<JobCategories>{

  @override
  void initState() {
    super.initState();
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
          Card(
            color: colors[index],
            child: Container(
              height: 152,
              width: 150,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                        height: 150,
                        child: new Stack(
                          children: <Widget>[
                            new Positioned(
                                child:Center(
                                  child: InkWell(
                                    onTap: (){
                                    },
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: CachedImage(
                                      height: 150,
                                      width: 150,
                                      shape: BoxShape.rectangle,
                                      url: widget.job_categories_list[index].img,
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
                "  "+'${widget.job_categories_list[index].name}', maxLines: 1,overflow: TextOverflow.ellipsis,
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
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
      color: Colors.transparent,
      height: 180,
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




}
