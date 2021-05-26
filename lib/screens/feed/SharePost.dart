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
      appBar: AppBar(title: Text('Share Post'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 40,right: 20,bottom: 20),
            child: RaisedButton(
              child: Text(
                "Post Upload"
              ),
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      )
    );
  }
}
