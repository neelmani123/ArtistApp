

import 'package:artist_icon/screens/home_page/template_listModel/Data.dart';

class TemplateListModel {
    List<DataTemp> data;
    String message;
    bool status;

    TemplateListModel({this.data, this.message, this.status});

    factory TemplateListModel.fromJson(Map<String, dynamic> json) {
        return TemplateListModel(
            data: json['data'] != null ? (json['data'] as List).map((i) => DataTemp.fromJson(i)).toList() : null,
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