import 'package:artist_icon/screens/Color.dart';
import 'package:flutter/material.dart';

class JobSearchList extends StatefulWidget {
  const JobSearchList({Key key}) : super(key: key);

  @override
  _JobSearchListState createState() => _JobSearchListState();
}

class _JobSearchListState extends State<JobSearchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF534ff4),
      appBar: PreferredSize(
        preferredSize: Size(200, 200), //width and height
        // The size the AppBar would prefer if there were no other constraints.
        child: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person),
                  Text('Name'),
                  Spacer(),
                  Icon(Icons.person_pin)
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Color(blueGreyColor),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.all(12.0),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Icon(Icons.search,color: Colors.grey,),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: (){

                                  },
                                  child: Text("Search Job..",style: TextStyle(color: Colors.grey,fontSize: 16),))

                            ],
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Popular Jobs"),
                  Spacer(),
                  Icon(Icons.wrap_text)
                ],
              )
            ],
          )
        ),
      ),
      //backgroundColor: Color(0xFF524ff4),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (BuildContext,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text('Manager -Business Development',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                  //Icon(Icons.person),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('3000-3500 per month',style: TextStyle(color: Colors.grey),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text('Pasadena Oklahoma',style: TextStyle(color: Colors.grey),),
                        Spacer(),
                        Text('Full Time or remote',style: TextStyle(color: Colors.red),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Divider( color: Colors.grey,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text('5-6 years',style: TextStyle(color: Colors.grey),),
                        Spacer(),
                        Text('Twitter',style: TextStyle(color: Colors.black),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
