class UserEducation {
  String id;
  String schoolName;
  String educationLevel;
  String filledOfStudy;
  String startDate;
  String endDate;
  String currentlyStudyHere;
  String educationLocation;
  String userId;
  String createdAt;
  String status;

  UserEducation(
      {this.id,
        this.schoolName,
        this.educationLevel,
        this.filledOfStudy,
        this.startDate,
        this.endDate,
        this.currentlyStudyHere,
        this.educationLocation,
        this.userId,
        this.createdAt,
        this.status});

  UserEducation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolName = json['school_name'];
    educationLevel = json['education_level'];
    filledOfStudy = json['filled_of_study'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    currentlyStudyHere = json['currently_study_here'];
    educationLocation = json['education_location'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_name'] = this.schoolName;
    data['education_level'] = this.educationLevel;
    data['filled_of_study'] = this.filledOfStudy;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['currently_study_here'] = this.currentlyStudyHere;
    data['education_location'] = this.educationLocation;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}
