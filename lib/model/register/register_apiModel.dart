

import 'package:artist_icon/model/register/Data.dart';

class register_apiModel {
    Data data;
    String message;
    bool status;

    register_apiModel({ this.data,  this.message,  this.status});

    factory register_apiModel.fromJson(Map<String, dynamic> json) {
        return register_apiModel(
            data: json['data'] != null ? Data.fromJson(json['data']) : null,
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}