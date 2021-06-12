

import 'package:artist_icon/screens/feed/model/getAllPost/feed/Data.dart';

class FeedModel {
    List<Dataa> data;
    String message;
    int page_count;
    bool status;

    FeedModel({this.data, this.message, this.page_count, this.status});

    factory FeedModel.fromJson(Map<String, dynamic> json) {
        return FeedModel(
            data: json['data'] != null ? (json['data'] as List).map((i) => Dataa.fromJson(i)).toList() : null,
            message: json['message'], 
            page_count: json['page_count'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['page_count'] = this.page_count;
        data['status'] = this.status;
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}