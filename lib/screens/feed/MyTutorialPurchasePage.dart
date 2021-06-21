import 'package:artist_icon/model/TutorialPurchaseList/TutorialPurchaseProductList.dart';
import 'package:artist_icon/screens/Color.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class MyTutorialPurchasePage extends StatefulWidget {
  final List<ProductData> data;
  final String name;
  final String img;
  final String price;
  final String id;
  final isPlay;
  const MyTutorialPurchasePage({this.data,this.name,this.img,this.price,this.id,this.isPlay,Key key}) : super(key: key);

  @override
  _MyTutorialPurchasePageState createState() => _MyTutorialPurchasePageState();
}

class _MyTutorialPurchasePageState extends State<MyTutorialPurchasePage> {
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

                  ),
                  SizedBox(height: 5,),

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
