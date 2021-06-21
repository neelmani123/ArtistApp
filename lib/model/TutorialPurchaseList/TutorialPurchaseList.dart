import 'package:artist_icon/model/TutorialPurchaseList/TutorilaPurchaseListData.dart';

class TutorialPurchaseList{
  bool status;
  String message;
  int pageCount;
  List<Data> data;

  TutorialPurchaseList({this.status, this.message, this.pageCount, this.data});

  TutorialPurchaseList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    pageCount = json['page_count'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['page_count'] = this.pageCount;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
