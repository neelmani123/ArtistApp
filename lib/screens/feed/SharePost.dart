import 'package:flutter/material.dart';

class SharePost extends StatefulWidget {
  const SharePost({Key key}) : super(key: key);

  @override
  _SharePostState createState() => _SharePostState();
}

class _SharePostState extends State<SharePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.grey,
          //backgroundColor: Colors.grey,
          title: Text('Share Post'),
         flexibleSpace:  Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(
                 Radius.circular(20.0) //                 <--- border radius here
             ),
           ),
           padding: EdgeInsets.only(left:250,right: 20,top: 60),
           child: RaisedButton(
             //color: Colors.grey,
             onPressed: (){},
             child: Text('Post Upload'),),
         ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
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
                          "https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg"
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Diya Roy',style: TextStyle(color: Colors.white),),
                )
              ],
            ),

            Container(
              padding: EdgeInsets.only(left: 10,top: 10),
              child: TextField(
                maxLines: 10,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "What's On Your Mind",
                  hintStyle: TextStyle(
                    color: Colors.white
                  )

                ),
              ),
            )

          ],
        ),
      )
    );
  }
}
