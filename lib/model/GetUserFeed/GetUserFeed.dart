import 'package:artist_icon/model/GetUserFeed/GetUserFeedData.dart';

class GetUserFeed{
  bool status;
  String message;
  int pageCount;
  String userName;
  String profileImage;
  List<Data> data;

  GetUserFeed(
      {this.status,
        this.message,
        this.pageCount,
        this.userName,
        this.profileImage,
        this.data});

  GetUserFeed.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    pageCount = json['page_count'];
    userName = json['user_name'];
    profileImage = json['profile_image'];
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
    data['user_name'] = this.userName;
    data['profile_image'] = this.profileImage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}