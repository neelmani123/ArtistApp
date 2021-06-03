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
        choice="selected";
        break;
      case '4':
        choice="not selected";
        break;
      default:
        choice = null;

    }
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      height:30,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Color(fountColor),
                      ),
                      padding: EdgeInsets.only(left: 25,top: 5,),
                      child: Text('${choice??''}',style: TextStyle(color: Colors.white),),
                    ),
                  ],
              ),
               ),
              Center(
                child: Padding(
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
                      SizedBox(height: 5,),
                      Text('${widget.details['phone']??''}',style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 5,),
                      Text('${widget.details['email']??''}',style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 5,),
                      Text('${widget.details['gender']??''}',style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(color: Color(fountColor),)),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('User Education:',style: TextStyle(fontSize: 20,color: Color(fountColor)),),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                child: ListView.builder(
                  itemCount: widget.details.length,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              Text('${widget.details['user_education'][index]['school_name']??''}',style:TextStyle(color: Colors.grey),),
                              Text('${widget.details['user_education'][index]['education_level']??''}',style:TextStyle(color: Colors.grey),),
                                Text('${widget.details['user_education'][index]['filled_of_study']??''}',style:TextStyle(color: Colors.grey),),
                                Text('${widget.details['user_education'][index]['education_location']??''}',style:TextStyle(color: Colors.grey),),
                            ],),
                            SizedBox(height: 50,)
                          ],
                        ),
                      ),
                    );

                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
