import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/profile/model/UserEducation.dart';
import 'package:flutter/material.dart';

class EducationScreen extends  StatefulWidget{
  List<UserEducation> job_categories_list=[];
EducationScreen({Key key, this.job_categories_list}) : super(key: key);

@override
State<StatefulWidget> createState() {

  return AllCollectionsState();
}

}
class AllCollectionsState extends State<EducationScreen>{



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
              children: [
                Card(
                  color: Color(blueGreyColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    child:Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          color: Colors.transparent,
                          alignment: Alignment.topLeft,
                          margin: new EdgeInsets.only(left: 5),
                          child: Text(
                            "  "+'${widget.job_categories_list[index].education_level}', maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'RobotoSlab',),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 12,top: 7),
                          color: Colors.transparent,
                          alignment: Alignment.topLeft,
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "  "+'${widget.job_categories_list[index].school_name}', maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12,color: Colors.grey,fontFamily: 'RobotoSlab',),
                          ),
                        ),

                        /*Container(
                          color: Colors.transparent,
                          alignment: Alignment.topLeft,
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "  "+'${widget.job_categories_list[index].filled_of_study}', maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16,color: Colors.grey),
                          ),
                        ),*/

                        Container(
                          color: Colors.transparent,
                          alignment: Alignment.topLeft,
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15,top: 7),
                                child: Text(
                                  '${""+widget.job_categories_list[index].start_date}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16,color: Colors.grey,fontFamily: 'RobotoSlab',),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  '${" "+widget.job_categories_list[index].end_date}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16,color: Colors.grey,fontFamily: 'RobotoSlab',),
                                ),
                              ),
                            ],
                          ),
                        ),

SizedBox(height: 10,)

                      ],
                    ),
                  ),
                ),

              ],
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
