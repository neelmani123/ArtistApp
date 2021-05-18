
import 'package:artist_icon/screens/search/model/skills/Data.dart';

class SkillsListBean {
    List<DataSkills> data;
    String message;
    bool status;

    SkillsListBean({this.data, this.message, this.status});

    factory SkillsListBean.fromJson(Map<String, dynamic> json) {
        return SkillsListBean(
            data: json['data'] != null ? (json['data'] as List).map((i) => DataSkills.fromJson(i)).toList() : null,
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