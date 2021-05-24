import 'package:artist_icon/screens/Color.dart';
import 'package:artist_icon/screens/edit_profile/EditProfileScreen.dart';
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
  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  Future get_name() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name=prefs.getString('name');
    });
    print("Name is${name}");
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
        'page': FeedScreen(),
      },
      {
        'page': ProfileScreen(),
      }
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
                      style: TextStyle(color: Color(fountColor),fontSize: 20),
                     ):Text(
                          tital(),
                       style: TextStyle(color: Color(fountColor)),
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
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.edit,color: Color(fountColor),), onPressed: (
                            ){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(
                                ),
                              ));
                        }),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfileScreen(
                                  ),
                                ));
                          },
                          child: Text("Edit",style: TextStyle(
                            fontSize: 20,
                            color:Color(fountColor),
                          ),),
                        ),
                      ],
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
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(Icons.local_post_office_outlined),
              label: 'Job',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(Icons.feedback),
              label: 'Feed',
            ),

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
