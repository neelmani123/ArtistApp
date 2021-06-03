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
                          Row(
                            children: [
                              Icon(Icons.phone,color: Colors.grey,size: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('${widget.details['phone']??''}',style: TextStyle(color: Colors.grey),),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.email_outlined,color: Colors.grey,size: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('${widget.details['email']??''}',style: TextStyle(color: Colors.grey),),
                              ),
                            ],
                          ),
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(color: Color(fountColor),)),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(5),
                child: Card(
                  elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Additional info",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children:
                        [
                          Icon(Icons.person_remove,color: Colors.grey,size: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('${widget.details['gender']??''}'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        children:
                        [
                          Icon(Icons.location_city,color: Colors.grey,size: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('${widget.details['home_town']??''}'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        children:
                        [
                          Icon(Icons.location_city,color: Colors.grey,size: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('${widget.details['your_interests']??''}'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        children:
                        [
                          Icon(Icons.location_city,color: Colors.grey,size: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('${widget.details['profile_summary']??''}'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('User Education:',style: TextStyle(fontSize: 20,color: Color(fountColor)),),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                child: ListView.builder(
                  itemCount: widget.details['user_education'].length,
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
              SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('User Work:',style: TextStyle(fontSize: 20,color: Color(fountColor)),),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                child: ListView.builder(
                    itemCount:  widget.details['user_work'].length,
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
                                  Text('${widget.details['user_work'][index]['company_name']??''}',style:TextStyle(color: Colors.grey),),
                                  Text('${widget.details['user_work'][index]['position']??''}',style:TextStyle(color: Colors.grey),),
                                  Text('${widget.details['user_work'][index]['company_location']??''}',style:TextStyle(color: Colors.grey),),
                                  //Text('${widget.details['user_work'][index]['education_location']??''}',style:TextStyle(color: Colors.grey),),
                                ],),
                              SizedBox(height: 50,)
                            ],
                          ),
                        ),
                      );

                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('User Language:',style: TextStyle(fontSize: 20,color: Color(fountColor)),),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                child: ListView.builder(
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${widget.details['user_languages'][index]['languages']??''}',style:TextStyle(color: Colors.grey),),
                                  ),
                                 SizedBox(height: 20,),
                                 // Text('${widget.details['user_languages'][index]['position']??''}',style:TextStyle(color: Colors.grey),),
                                  //Text('${widget.details['user_languages'][index]['company_location']??''}',style:TextStyle(color: Colors.grey),),
                                  //Text('${widget.details['user_work'][index]['education_location']??''}',style:TextStyle(color: Colors.grey),),
                                ],),
                              SizedBox(height: 50,)
                            ],
                          ),
                        ),
                      );

                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Skill:',style: TextStyle(fontSize: 20,color: Color(fountColor)),),
              ),
              SizedBox(height: 10,),
              Container(
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
                                    child: Text('${widget.details['skills_name'][index]['name']??''}',style:TextStyle(color: Colors.grey),),
                                  ),
                                  SizedBox(height: 20,),
                                  // Text('${widget.details['user_languages'][index]['position']??''}',style:TextStyle(color: Colors.grey),),
                                  //Text('${widget.details['user_languages'][index]['company_location']??''}',style:TextStyle(color: Colors.grey),),
                                  //Text('${widget.details['user_work'][index]['education_location']??''}',style:TextStyle(color: Colors.grey),),
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
