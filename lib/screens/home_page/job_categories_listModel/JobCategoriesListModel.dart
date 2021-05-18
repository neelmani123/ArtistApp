

import 'package:artist_icon/screens/home_page/job_categories_listModel/Data.dart';

class JobCategoriesListModel {
    List<Data> data;
    String message;
    bool status;

    JobCategoriesListModel({this.data, this.message, this.status});

    factory JobCategoriesListModel.fromJson(Map<String, dynamic> json) {
        return JobCategoriesListModel(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}