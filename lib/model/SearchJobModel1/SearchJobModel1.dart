import 'package:artist_icon/model/SearchJobModel1/SearchJobData.dart';

class SearchJobModel1
{
  bool status;
  String message;
  int totalPages;
  List<Data> data;
  SearchJobModel1({this.status, this.message, this.totalPages, this.data});

  SearchJobModel1.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalPages = json['total_pages'];
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
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

}