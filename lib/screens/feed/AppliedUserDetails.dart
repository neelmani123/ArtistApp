import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/feed/ChangeStatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppliedUserDetails extends StatefulWidget {
  final Map<dynamic,dynamic> details;
  final String type;
  const AppliedUserDetails({this.details,this.type,Key key}) : super(key: key);

  @override
  _AppliedUserDetailsState createState() => _AppliedUserDetailsState();
}

class _AppliedUserDetailsState extends State<AppliedUserDetails> {
  String choice;
  Future select(){
    String no=widget.type;
    switch(no)
    {
      case '0':
        choice="Pending";
        break;
      case '1':
        choice = "Shortlist Application";
        break;
      case '2':
        choice="Interview";
        break;
      case '3':
        choice="Selected";
        break;
      case '4':
        choice="not selected";
        break;
      default:
        choice = null;

    }
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
                    child:Row(
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
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              color: Colors.transparent,
                              alignment: Alignment.topLeft,
                              margin: new EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "  "+'${widget.details['user_education'][index]['education_level']}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20,color: Colors.black),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(left: 15,top: 7),
                              color: Colors.transparent,
                              alignment: Alignment.topLeft,
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                "  "+'${widget.details['user_education'][index]['school_name']}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16,color: Colors.grey),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20,top: 7),
                                    child: Text(
                                      '${""+widget.details['user_education'][index]['start_date']}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16,color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 5),
                                    child: Text(
                                      '${""+widget.details['user_education'][index]['end_date']}', maxLines: 1,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16,color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10,)

                          ],
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

      onTap: (){

      },
    );
  }
  buildItem1(BuildContext context, int index) {
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
                                      '${widget.details['user_work'][index]['position']}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'OpenSans',
                                          color: Colors.black),
                                    ),

                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,top: 10),
                                    color: Colors.transparent,
                                    alignment: Alignment.topLeft,
                                    //margin: new EdgeInsets.symmetric(horizontal: 10,),
                                    child: Text(
                                      '${widget.details['user_work'][index]['company_name']}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
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
                                          '${widget.details['user_work'][index]['start_date']}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 16, fontFamily:'OpenSans',color: Colors.grey),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                            '${"" + widget.details['user_work'][index]['end_date']}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 16, color: Colors.grey),
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
  void initState() {
    // TODO: implement initState
  select();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.type);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeStatus(jobId: widget.details['applied_job_id'],)));

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: 60.0,
                            width: 60.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg"
                                  )
                              ),
                            ),

                          ),
                          Text("${widget.details['name']??''}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          SizedBox(height: 10,),
                          Text('${widget.details['profile_summary']??''}',style: TextStyle(color: Colors.grey),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text('${widget.details['home_town']??''}',style: TextStyle(color: Colors.grey),),
                              Text(',${widget.details['country']??''}',style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text('${widget.details['phone']??''}',style: TextStyle(color: Colors.grey),),
                          SizedBox(height: 10,),
                          Text('${widget.details['email']??''}',style: TextStyle(color: Colors.grey),),
                          SizedBox(height: 5,),

                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(left:20,right: 15,bottom: 20),
                      height:30,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(fountColor),
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                      child: Text("${choice??''}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 20),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Color(fountColor),fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'Edu', style: TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: 'cation', style: TextStyle())
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                color: Color(blueGreyColor),
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(0),
                    itemCount: widget.details['user_education'].length,
                    itemBuilder: (context, index) {
                      return buildItem(context, index);
                    },

                  ),

                ),
              ),
              SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Color(fountColor),fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'Work', style: TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: 'Experience', style: TextStyle())
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                color: Color(blueGreyColor),
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(0),
                    itemCount: widget.details['user_education'].length,
                    itemBuilder: (context, index) {
                      return buildItem1(context, index);
                    },

                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Color(fountColor),fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'Lan', style: TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: 'guages', style: TextStyle())
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color(blueGreyColor),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(0),
                      itemCount: widget.details['user_languages'].length,
                      itemBuilder: (BuildContext,index){
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20,top: 10),
                                      child: Text('${widget.details['user_languages'][index]['languages']??''}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'OpenSans',
                                            color: Colors.black),),
                                    ),
                                    SizedBox(height: 20,),

                                  ],),
                                SizedBox(height: 60,)
                              ],
                            ),
                          ),
                        );

                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Color(fountColor),fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'Ski', style: TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: 'lls', style: TextStyle())
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color(blueGreyColor),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2,
                  child: ListView.builder(
                      itemCount:widget.details['skills_name'].length,
                      itemBuilder: (BuildContext,index){
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${widget.details['skills_name'][index]['name']??''}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'OpenSans',
                                            color: Colors.black),),
                                    ),
                                    SizedBox(height: 20,),
                                  ],),
                                SizedBox(height: 50,)
                              ],
                            ),
                          ),
                        );

                      }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
