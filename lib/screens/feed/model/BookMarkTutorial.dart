import 'package:artist_icon/model/GetAllBookMark/GetBookMarkProductData.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class BookMarkTutorial extends StatefulWidget {
  final List<ProductData> data;
  final String name;
  final String img;
  final String price;
  final String id;
  final isPlay;
  const BookMarkTutorial({this.name,this.img,this.price,this.id,this.isPlay,this.data,Key key}) : super(key: key);

  @override
  _BookMarkTutorialState createState() => _BookMarkTutorialState();
}

class _BookMarkTutorialState extends State<BookMarkTutorial> {
  bool _isLoading;
  @override
  Widget build(BuildContext context) {
    print('Is Play is :${widget.isPlay}');
    return Scaffold(
      appBar: AppBar(title: Text("Tutorial Page"),),
      body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
          itemCount: widget.data.length,
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
                                "${widget.img??''}"
                            ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(widget.name??'',style: TextStyle(fontFamily: 'RobotoSlab'),),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text('09-11-2020',style: TextStyle(fontFamily: 'RobotoSlab'),),
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
                    child: Text(widget.data[index].title??'',style: TextStyle(color: Colors.grey,fontFamily: 'RobotoSlab'),),
                  ),
                  SizedBox(height: 10,),
                  widget.isPlay==0?Container(
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.lock,color: Color(fountColor),size: 40,),
                        ],
                      ),
                    ),): Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: BetterPlayer.network("${widget.data[index].product}",
                      betterPlayerConfiguration: BetterPlayerConfiguration(
                        aspectRatio: 1,
                        looping: true,
                        autoPlay: false,
                        fit: BoxFit.cover,

                      ),),

                    /*decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(
                            "${widget.data['product_data'][index]['product']??''}"
                        ),

                      ),
                    ),*/
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
                          child: Text("Livin'",style: TextStyle(fontFamily: 'RobotoSlab'),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('taht neon life!',style: TextStyle(fontFamily: 'RobotoSlab'),),
                        ),
                        /* Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('View comments',style: TextStyle(fontWeight:FontWeight.bold,color: Color(fountColor)),),
                        ),*/
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                 /* TextField(
                    enabled: false,
                    controller: amount_controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "${widget.price}",
                        hintStyle: TextStyle(color: Colors.black,fontFamily: 'RobotoSlab')
                    ),
                  ),*/
                  SizedBox(height: 20),
                  /*Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 20,bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.10),),
                      // side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                      onPressed: () async{
                        openCheckOut();
                        setState(() {
                          //_isLoading=true;
                          // purchase_tutorial();
                          openCheckOut();
                        });
                      },
                      color: Color(fountColor),
                      // textColor: Colors.white,
                      child: Text("Pay",
                          style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'RobotoSlab')),
                    ),
                  ),*/
                ],
              ),
            );
          }),

    );
  }
}
