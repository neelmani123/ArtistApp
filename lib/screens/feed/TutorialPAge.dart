import 'package:flutter/material.dart';
class TutorialPAge extends StatefulWidget {
  final Map<dynamic,dynamic> data;
  const TutorialPAge({this.data,Key key}) : super(key: key);

  @override
  _TutorialPAgeState createState() => _TutorialPAgeState();
}

class _TutorialPAgeState extends State<TutorialPAge> {
  bool _isLoading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tutorial Page"),),
      body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
          itemCount: widget.data['product_data'].length,
          itemBuilder: (context,index){
            return Card(
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      new Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "${widget.data['user_image']??''}"
                            ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(widget.data['user_name']??''),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text('09-11-2020'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: new IconButton(
                          icon: Icon(Icons.more_horiz,color: Colors.black,),
                          onPressed: null,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,top: 5),
                    child: Text(widget.data['text']??'',style: TextStyle(color: Colors.grey),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(
                            "${widget.data['product_data'][index]['product']??''}"
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  /*Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            _isLoading==true;
                            doLike(data1[index]['id']);
                          });
                          if (data1[index]['is_like'] == 0) {
                            setState(() {
                              data1[index]['is_like'] = 1;
                            });
                          } else if (data1[index]['is_like'] == 1) {
                            setState(() {
                              data1[index]['is_like'] = 0;

                            });
                          }
                        },
                        child:data1[index]['is_like']==1?Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.favorite,size: 20,color: Colors.red,),
                        ):Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.favorite_border,size: 20,color: Colors.black,),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentScreen(data: data1[index],)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(
                            FontAwesomeIcons.comment,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(FontAwesomeIcons.shareAlt,size: 18,  color: Colors.black,),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _isLoading==true;
                            doBookmark(data1[index]['id']);
                          });
                          if (data1[index]['is_bookmark'] == 0) {
                            setState(() {
                              data1[index]['is_bookmark'] = 1;
                            });
                          } else if (data1[index]['is_bookmark'] == 1) {
                            setState(() {
                              data1[index]['is_bookmark'] = 0;

                            });
                          }
                        },
                        child: data1[index]['is_bookmark']==1?Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(FontAwesomeIcons.bookmark,size: 20,  color: Colors.red,),
                        ):Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(FontAwesomeIcons.bookmark,size: 20,  color: Colors.grey,),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,top: 10),
                    child: Text('${data1[index]['like_count']??''} likes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("Livin'"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('taht neon life!'),
                        ),
                       /* Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('View comments',style: TextStyle(fontWeight:FontWeight.bold,color: Color(fountColor)),),
                        ),*/
                      ],
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            );
          }),

    );
  }
}
