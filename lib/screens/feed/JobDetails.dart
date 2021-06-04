import 'package:artist_icon/screens/Color.dart';
import 'package:flutter/material.dart';
class JobDetails extends StatefulWidget {
  final Map details;
  const JobDetails({this.details,Key key}) : super(key: key);

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FBFE),
      body: ListView(
        children: [
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Center(
            child: Column(
              children: [
                new Container(
                  height: 70.0,
                  width: 70.0,
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
                SizedBox(height: 10,),
                Text('${widget.details['title']??''}',style: TextStyle(color: Colors.black),),
                SizedBox(height: 10,),
               // Text('${widget.details['company_name']??''}',style: TextStyle(color: Colors.black),),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black,),
                    children: <TextSpan>[
                      TextSpan(text: '${widget.details['company_name']??''}',),
                      TextSpan(text: ',${widget.details['location']??''}', )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Text('Posted on ${widget.details['created_at']}',style: TextStyle(color: Colors.black),),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 190,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.grey
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Working Hours',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Full Time',
                        style: TextStyle(
                            color: Color(fountColor),
                            fontSize: 17),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 190,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Monthly Salary',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                      Text(
                        '30k-50k',
                        style: TextStyle(
                            color: Color(fountColor),
                            fontSize: 17),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Color(fountColor),fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'Job', style: TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: ' Description', style: TextStyle())
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("${widget.details['job_description']??''}",style: TextStyle(color: Colors.black),),
              )
            ],
          ),
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Color(fountColor),fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'Key', style: TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: ' Skills', style: TextStyle())
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Ballet,Ballroom,Contemporary",style: TextStyle(color: Colors.black),),
              )
            ],
          ),
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Color(fountColor),fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'Other', style: TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: ' Details', style: TextStyle())
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("${widget.details['other_skills']}",style: TextStyle(color: Colors.black),),
              ),
              SizedBox(height: 50,),
              Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 20,bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight:Radius.circular(10)),),
                    // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () async{
                      setState(() {

                      });
                    },
                    color: Color(fountColor),
                    // textColor: Colors.white,
                    child: Text("Apply Now",
                        style: TextStyle(fontSize: 20,color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ],
      )
        ],
      ),
    );
  }
}
