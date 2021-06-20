import 'package:artist_icon/model/YourJobPostApplied/UserEducation.dart';
import 'package:artist_icon/model/YourJobPostApplied/UserLanguage.dart';
import 'package:artist_icon/model/YourJobPostApplied/UserSkill.dart';
import 'package:artist_icon/model/YourJobPostApplied/UserWork.dart';

class Data {
  String selectType;
  String selectDate;
  String appliedJobId;
  String userId;
  String jobId;
  String name;
  String email;
  String createdAt;
  String status;
  String phone;
  String profileSummary;
  String gender;
  String homeTown;
  Null country;
  String perfectWorkLocation;
  String resumeHeadline;
  String yourInterests;
  String profileImg;
  Null resume;
  List<UserEducation> userEducation;
  List<UserWork> userWork;
  List<UserLanguages> userLanguages;
  List<UserSkill> skillsName;

  Data(
      {this.selectType,
        this.selectDate,
        this.appliedJobId,
        this.userId,
        this.jobId,
        this.name,
        this.email,
        this.createdAt,
        this.status,
        this.phone,
        this.profileSummary,
        this.gender,
        this.homeTown,
        this.country,
        this.perfectWorkLocation,
        this.resumeHeadline,
        this.yourInterests,
        this.profileImg,
        this.resume,
        this.userEducation,
        this.userWork,
        this.userLanguages,
        this.skillsName});

  Data.fromJson(Map<String, dynamic> json) {
    selectType = json['select_type'];
    selectDate = json['select_date'];
    appliedJobId = json['applied_job_id'];
    userId = json['user_id'];
    jobId = json['job_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    status = json['status'];
    phone = json['phone'];
    profileSummary = json['profile_summary'];
    gender = json['gender'];
    homeTown = json['home_town'];
    country = json['country'];
    perfectWorkLocation = json['perfect_work_location'];
    resumeHeadline = json['resume_headline'];
    yourInterests = json['your_interests'];
    profileImg = json['profile_img'];
    resume = json['resume'];
    if (json['user_education'] != null) {
      userEducation = new List<UserEducation>();
      json['user_education'].forEach((v) {
        userEducation.add(new UserEducation.fromJson(v));
      });
    }
    if (json['user_work'] != null) {
      userWork = new List<UserWork>();
      json['user_work'].forEach((v) {
        userWork.add(new UserWork.fromJson(v));
      });
    }
    if (json['user_languages'] != null) {
      userLanguages = new List<UserLanguages>();
      json['user_languages'].forEach((v) {
        userLanguages.add(new UserLanguages.fromJson(v));
      });
    }
    /*if (json['skills_name'] != null) {
      skillsName = new List<Null>();
      json['skills_name'].forEach((v) {
        skillsName.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['select_type'] = this.selectType;
    data['select_date'] = this.selectDate;
    data['applied_job_id'] = this.appliedJobId;
    data['user_id'] = this.userId;
    data['job_id'] = this.jobId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['profile_summary'] = this.profileSummary;
    data['gender'] = this.gender;
    data['home_town'] = this.homeTown;
    data['country'] = this.country;
    data['perfect_work_location'] = this.perfectWorkLocation;
    data['resume_headline'] = this.resumeHeadline;
    data['your_interests'] = this.yourInterests;
    data['profile_img'] = this.profileImg;
    data['resume'] = this.resume;
    if (this.userEducation != null) {
      data['user_education'] =
          this.userEducation.map((v) => v.toJson()).toList();
    }
    if (this.userWork != null) {
      data['user_work'] = this.userWork.map((v) => v.toJson()).toList();
    }
    if (this.userLanguages != null) {
      data['user_languages'] =
          this.userLanguages.map((v) => v.toJson()).toList();
    }
   /* if (this.skillsName != null) {
      data['skills_name'] = this.skillsName.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}