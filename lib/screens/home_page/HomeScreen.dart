import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/edit_profile/EditProfileScreen.dart';
import 'package:artist_icon/screens/feed/Bookmark.dart';
import 'package:artist_icon/screens/feed/MyFeed.dart';
import 'package:artist_icon/screens/feed/GetAllFeed.dart';
import 'package:artist_icon/screens/feed/AllJobPostList.dart';
import 'package:artist_icon/screens/feed/AppliedJobList.dart';
import 'package:artist_icon/screens/feed/CreatePost.dart';
import 'package:artist_icon/screens/feed/CreateJobPost.dart';
import 'package:artist_icon/screens/feed/MyTutorialPurchase.dart';
import 'package:artist_icon/screens/feed/UserTutorialLIst.dart';
import 'package:artist_icon/screens/feed/YourJobPostList.dart';
import 'package:artist_icon/screens/feed/SearchList.dart';
import 'package:artist_icon/screens/feed/SharePost.dart';
import 'package:artist_icon/screens/feed/FeedScreen.dart';
import 'package:artist_icon/screens/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  int _index = 0;
  String name=" ";
  String imageUrl="";
  String email='';
  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  Future get_name() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name=prefs.getString('name');
      imageUrl=prefs.get('img');
      email=prefs.get('email');
    });
    print("Name is${name}");
    print("Image is:${imageUrl}");
  }
  @override
  void initState() {
    super.initState();
   get_name();
  }

  Map<String, Object> _getPage() {
    final List<Map<String, Object>> _pages = [
      {
        'page':Home(),
      },
      {
        'page': AddFeed(),
      },

      {
        'page': ProfileScreen(),
      },
    ];

    return _pages[_selectedPageIndex];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:(){
        if(_selectedPageIndex==0){
          SystemNavigator.pop();
        }else{
          setState(() {
            _selectedPageIndex=0;
          });

        }
      },
      child: Scaffold(
        //drawer: CustomDrawer(),
       drawer: Drawer(
         child: ListView(
           children: [
             Container(
               height: 200,
               child: DrawerHeader(
                 decoration: BoxDecoration(
                   color: Colors.white,
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 10,),
                     Container(
                       height: 60.0,
                       width: 60.0,
                       decoration: new BoxDecoration(
                         shape: BoxShape.circle,
                         image: new DecorationImage(
                           fit: BoxFit.fill,
                           image: new NetworkImage(
                               "${imageUrl??''}"
                           ),
                         ),
                       ),
                     ),
                     SizedBox(height: 10,),
                     Text("${name}"),
                     SizedBox(height: 10,),
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(right: 40),
                           child: Text("${email}"),
                         ),
                         //Spacer(),
                         /*Container(
                           width: 86,
                           height: 30,
                          margin: EdgeInsets.only(bottom: 40),
                           decoration: BoxDecoration(
                               border: Border.all(color: Colors.black),
                             borderRadius: BorderRadius.all(Radius.circular(5))
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: Text('Edit Profile',style: TextStyle(color: Color(fountColor)),),
                           ),
                         )*/
                       ],
                     ),
                   ],
                 )
               ),
             ),
             /*ListTile(
               title: Text('Create Post',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>CreatePost()));
               },
             ),*/
             ListTile(
               title: Text('Job Post',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>CreateJobPost()));
               },
             ),
             ListTile(
               title: Text('Your Job List',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>JobPostList()));
               },
             ),
             ListTile(
               title: Text('Search List',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>AllJobPostList()));
               },
             ),
             /*ListTile(
               title: Text('Job Search List',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>JobSearchList()));
               },
             ),*/
             ListTile(
               title: Text('Applied Job List',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>AppliedJobList()));
               },
             ),
             ListTile(
               title: Text('Get Bookmark',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>Bookmark()));
               },
             ),
             ListTile(
               title: Text('Add Feed',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>SharePost()));
               },
             ),
             ListTile(
               title: Text('My Feed',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>MyFeed()));
               },
             ),
             ListTile(
               title: Text('My Tutorial List',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>MyTutorialPurchase()));
               },
             ),
             ListTile(
               title: Text('User Tutorial List',style: TextStyle(fontFamily: 'RobotoSlab',fontSize: 18,fontWeight: FontWeight.bold),),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>UserTutorialList()));
               },
             ),
             ListTile(
               title: Container(
                 padding: EdgeInsets.only(right: 70),
                 width: 50,
                 height: 50,
                 child: Card(
                   shape:RoundedRectangleBorder(
                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Icon(Icons.logout,color: Color(fountColor),),
                       Text('  Logout',style: TextStyle(color: Color(fountColor),fontWeight: FontWeight.bold),)
                     ],
                   ),
                 ),
               )
             ),
             SizedBox(height: 10,)
           ],
         ),
       ),
        appBar:PreferredSize(
          //Here is the preferred height.
          preferredSize: Size.fromHeight(70.0),
          child: SafeArea(
            child:  AppBar(
              title: Column(
                children: [
                  Row(
                    children: [
                     (_selectedPageIndex==0)?Text(
                      tital(),
                      style: TextStyle(color: Color(fountColor),fontSize: 20,fontFamily: 'RobotoSlab'),
                     ):Text(
                          tital(),
                       style: TextStyle(color: Color(fountColor),fontFamily: 'RobotoSlab'),
                     ),
                     ],
                  ),
                  // Container(margin: EdgeInsets.only(top: 10),
                  //   height: 40,
                  //   width: MediaQuery.of(context).size.width,
                  //   //color: Colors.grey,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey,
                  //           offset: Offset(0.0, 1.0), //(x,y)
                  //            blurRadius: 5.0,
                  //         ),
                  //       ],
                  //       borderRadius: BorderRadius.circular(10.10),
                  //       color: Colors.white,
                  //     ),
                  //     margin: EdgeInsets.only(
                  //         left: 15.0, right: 15.0, bottom: 0.0),
                  //     width: MediaQuery.of(context).size.width,
                  //     child: Padding(
                  //         padding: const EdgeInsets.all(10.0),
                  //         child: Row(
                  //           children: [
                  //             Text(
                  //               "Search",
                  //               style: TextStyle(
                  //                   color: Colors.grey, fontSize: 15),
                  //             ),
                  //              SizedBox(
                  //              width: 90,
                  //             ),
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(8.8),
                  //                 color: Color(boldColor),
                  //               ),
                  //               //height: 40,
                  //               width: 34,
                  //               child: Icon(
                  //                 Icons.search,size: 25,
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //             //Color(appBaseColor)
                  //           ],
                  //         )),
                  //   ),
                  // ),
                ],
              ),

              // leading: Builder(
              //   builder: (context) => IconButton(
              //     icon: Icon(Icons.menu),
              //     onPressed: (){
              //       Scaffold.of(context).openDrawer();
              //     },),
              // ),
              backgroundColor: Color(blueGreyColor),
              elevation: 0,
              actions: (_selectedPageIndex!=2)?[
                // IconButton(icon: Icon(Icons.shopping_bag_outlined), onPressed: (
                //     ){
                //   // Navigator.push(
                //   //     context,
                //   //     MaterialPageRoute(
                //   //       builder: (context) => CartListScreen(
                //   //       ),
                //   //     ));
                //
                // }),
                IconButton(icon: Icon(Icons.notifications),
                    onPressed: () async {

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => NotificationScreen(
                  //       ),
                  //     ));
                }),
              ]:
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                              ),
                            ));
                      },
                      child: Row(
                        children: [
                          Text("Edit Profile",style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'RobotoSlab',
                            color:Color(fountColor),
                          ),),
                          IconButton(icon: Icon(Icons.edit,color: Color(fountColor),),
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectTab,
          backgroundColor: Color(blueGreyColor),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color.fromRGBO(255, 63, 108, 1),
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.green,
              icon: Icon(Icons.local_post_office_outlined),
              label: 'Job',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(Icons.feedback),
              label: 'Feed',
            ),
           /*BottomNavigationBarItem(
    backgroundColor: Theme.of(context).accentColor,
    icon: Icon(Icons.add),
    label: 'Create Feed',
    ),*/
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
        body: _getPage()['page'],
      ),
    );
  }

  String tital()  {
    //String name='';
    if(_selectedPageIndex==0)
    {
      name='Hello,\nMorning,${name}';
    }
    if(_selectedPageIndex==1){
      name='Feed';
    }else if(_selectedPageIndex==2){
      name='Profile';
    }
    return name;
  }
}
