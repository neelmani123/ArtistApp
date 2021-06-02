import 'package:artist_icon/screens/Color.dart';
import 'package:flutter/material.dart';
class AppliedUserDetails extends StatefulWidget {
  final Map<dynamic,dynamic> details;
  const AppliedUserDetails({this.details,Key key}) : super(key: key);

  @override
  _AppliedUserDetailsState createState() => _AppliedUserDetailsState();
}

class _AppliedUserDetailsState extends State<AppliedUserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 40,),
              Row(
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
                  Text('${widget.details['name']??''}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(children: [
                  Icon(Icons.phone,color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('${widget.details['phone']??''}',style: TextStyle(color: Colors.grey),),
                  )
                ],),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Row(children: [
                  Icon(Icons.email,color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('${widget.details['email']??''}',style: TextStyle(color: Colors.grey),),
                  )
                ],),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Row(children: [
                  Icon(Icons.person,color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('${widget.details['gender']??''}',style: TextStyle(color: Colors.grey),),
                  )
                ],),
              ),
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Row(children: [
                  Icon(Icons.person,color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('${widget.details['country']??''}',style: TextStyle(color: Colors.grey),),
                  )
                ],),
              ),*/
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Row(children: [
                  Icon(Icons.person,color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('${widget.details['home_town']??''}',style: TextStyle(color: Colors.grey),),
                  )
                ],),
              ),*/
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(color: Color(fountColor),)),
            ],
          )
        ],
      ),
    );
  }
}
