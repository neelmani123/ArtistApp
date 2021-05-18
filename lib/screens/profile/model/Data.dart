
import 'package:artist_icon/screens/profile/model/SkillsName.dart';
import 'package:artist_icon/screens/profile/model/UserEducation.dart';
import 'package:artist_icon/screens/profile/model/UserLanguage.dart';
import 'package:artist_icon/screens/profile/model/UserWork.dart';

class Data {
    String country;
    String created_at;
    String email;
    String gender;
    String home_town;
    String id;
    String name;
    String perfect_work_location;
    String phone;
    String profile_img;
    String profile_summary;
    String resume;
    String resume_headline;
    List<SkillsName> skills_name;
    String status;
    List<UserEducation> user_education;
    List<UserLanguage> user_languages;
    List<UserWork> user_work;
    String your_interests;

    Data({this.country, this.created_at, this.email, this.gender, this.home_town, this.id, this.name, this.perfect_work_location, this.phone, this.profile_img, this.profile_summary, this.resume, this.resume_headline, this.skills_name, this.status, this.user_education, this.user_languages, this.user_work, this.your_interests});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            country: json['country'], 
            created_at: json['created_at'], 
            email: json['email'], 
            gender: json['gender'], 
            home_town: json['home_town'], 
            id: json['id'], 
            name: json['name'], 
            perfect_work_location: json['perfect_work_location'], 
            phone: json['phone'], 
            profile_img: json['profile_img'], 
            profile_summary: json['profile_summary'], 
            resume: json['resume'], 
            resume_headline: json['resume_headline'], 
            skills_name: json['skills_name'] != null ? (json['skills_name'] as List).map((i) => SkillsName.fromJson(i)).toList() : null, 
            status: json['status'], 
            user_education: json['user_education'] != null ? (json['user_education'] as List).map((i) => UserEducation.fromJson(i)).toList() : null, 
            user_languages: json['user_languages'] != null ? (json['user_languages'] as List).map((i) => UserLanguage.fromJson(i)).toList() : null, 
            user_work: json['user_work'] != null ? (json['user_work'] as List).map((i) => UserWork.fromJson(i)).toList() : null, 
            your_interests: json['your_interests'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['country'] = this.country;
        data['created_at'] = this.created_at;
        data['email'] = this.email;
        data['gender'] = this.gender;
        data['home_town'] = this.home_town;
        data['id'] = this.id;
        data['name'] = this.name;
        data['perfect_work_location'] = this.perfect_work_location;
        data['phone'] = this.phone;
        data['profile_img'] = this.profile_img;
        data['profile_summary'] = this.profile_summary;
        data['resume'] = this.resume;
        data['resume_headline'] = this.resume_headline;
        data['status'] = this.status;
        data['your_interests'] = this.your_interests;
        if (this.skills_name != null) {
            data['skills_name'] = this.skills_name.map((v) => v.toJson()).toList();
        }
        if (this.user_education != null) {
            data['user_education'] = this.user_education.map((v) => v.toJson()).toList();
        }
        if (this.user_languages != null) {
            data['user_languages'] = this.user_languages.map((v) => v.toJson()).toList();
        }
        if (this.user_work != null) {
            data['user_work'] = this.user_work.map((v) => v.toJson()).toList();
        }
        return data;
    }
}