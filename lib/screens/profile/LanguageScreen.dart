import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/profile/model/UserLanguage.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget{
  List<UserLanguage> job_categories_list=[];
  LanguageScreen({Key key, this.job_categories_list}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return AllCollectionsState();
  }

}
class AllCollectionsState extends State<LanguageScreen>{



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
                  elevation: 0,
                  child: Container(
                    child: Expanded(
                      flex: 1,
                      child: Container(
                        child: Stack(
                          children: [
                            Column(
                              children: <Widget>[

                                Container(
                                  color: Colors.transparent,
                                  alignment: Alignment.topLeft,
                                  margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(
                                    "  "+'${widget.job_categories_list[index].languages}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 16,fontFamily: 'RobotoSlab',),
                                  ),
                                ),


                              ],
                            ),


                          ],
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
