
import 'package:artist_icon/screens/search/model/city_list/Data.dart';

class CityListBean {
    List<DataCity> data;
    String message;
    bool status;

    CityListBean({this.data, this.message, this.status});

    factory CityListBean.fromJson(Map<String, dynamic> json) {
        return CityListBean(
            data: json['data'] != null ? (json['data'] as List).map((i) => DataCity.fromJson(i)).toList() : null,
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