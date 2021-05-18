

import 'package:artist_icon/screens/home_page/model/Data.dart';

class RecentSearchJobModel {
    List<Data> data;
    String message;
    bool status;
    int total_pages;

    RecentSearchJobModel({this.data, this.message, this.status, this.total_pages});

    factory RecentSearchJobModel.fromJson(Map<String, dynamic> json) {
        return RecentSearchJobModel(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
            message: json['message'], 
            status: json['status'], 
            total_pages: json['total_pages'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        data['total_pages'] = this.total_pages;
        if (this.data != null) {
            data['`data`'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}