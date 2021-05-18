import 'package:artist_icon/screens/api_helper/http_service.dart';
import 'package:artist_icon/screens/feed/FeedListItem.dart';
import 'package:artist_icon/screens/feed/model/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FeedScreenState();
  }
  
}

class FeedScreenState extends State<FeedScreen>{
  static int _pageSize = 1;
  List<Data> data=[];
  final isLastPage=0;
  int isLastPag=0;
  bool stats=false;
  final HttpService httpService = HttpService();
  final PagingController<int, Data> _pagingController =
  PagingController(firstPageKey: 1);



  Future<void> _fetchPage(int pageKey) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      httpService.get_all_post(jwtToken:prefs.getString('userID'), pages:pageKey.toString()).then((response) {
        if (response.status == true) {
          stats=response.page_count>_pageSize;
          final isLastPage = response.page_count < _pageSize;
          isLastPag=response.page_count;
          if (isLastPage) {
            _pagingController.appendLastPage(response.data);
          } else {
            if(response.data.length>0){
              final nextPageKey = pageKey + 1;
              _pagingController.appendPage(response.data, nextPageKey);
            }else{

            }

          }
        } else {
          Fluttertoast.showToast(
            msg: "Something Went Wrong",
            timeInSecForIosWeb: 10,
          );
        }
      });
    }
    catch(error) {
      _pagingController.error = error;
    }
  }



  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      PagedListView<int, Data>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Data>(
          itemBuilder: (context, item, index) => FeedListItem(
            character: item,
          ),

          newPageProgressIndicatorBuilder: (_) => newPageProgressIndicatorBuilder(),
          noMoreItemsIndicatorBuilder: (_) => noMoreItemsIndicatorBuilder(),
          noItemsFoundIndicatorBuilder: (_) => noItemsFoundIndicatorBuilder(),
        ),
      );
  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  ErrorIndicator({error, void Function() onTryAgain}) {
    return Text('List is empty');
  }



  Widget errorWidgetMaker() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("jkjjkjjk"),
        ),

      ],
    );
  }


  Widget noMoreItemsIndicatorBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("noMoreItemsIndicatorBuilder"),
        ),

      ],
    );

  }



  Widget noItemsFoundIndicatorBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("noItemsFoundIndicatorBuilder"),
        ),

      ],
    );

  }

  Widget newPageProgressIndicatorBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
              future: Future.delayed(Duration(seconds: 3)),
              builder: (c, s) => s.connectionState != ConnectionState.done
                  ? (stats)?CupertinoActivityIndicator(radius:22,
              ):Container()
                  : Text('')
          ),
        ),

      ],
    );

  }
}