
class UserEducation {
    String created_at;
    String currently_study_here;
    String education_level;
    String education_location;
    String end_date;
    String filled_of_study;
    String id;
    String school_name;
    String start_date;
    String status;
    String user_id;

    UserEducation({this.created_at, this.currently_study_here, this.education_level, this.education_location, this.end_date, this.filled_of_study, this.id, this.school_name, this.start_date, this.status, this.user_id});

    factory UserEducation.fromJson(Map<String, dynamic> json) {
        return UserEducation(
            created_at: json['created_at'], 
            currently_study_here: json['currently_study_here'], 
            education_level: json['education_level'], 
            education_location: json['education_location'], 
            end_date: json['end_date'], 
            filled_of_study: json['filled_of_study'], 
            id: json['id'], 
            school_name: json['school_name'], 
            start_date: json['start_date'], 
            status: json['status'], 
            user_id: json['user_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['currently_study_here'] = this.currently_study_here;
        data['education_level'] = this.education_level;
        data['education_location'] = this.education_location;
        data['end_date'] = this.end_date;
        data['filled_of_study'] = this.filled_of_study;
        data['id'] = this.id;
        data['school_name'] = this.school_name;
        data['start_date'] = this.start_date;
        data['status'] = this.status;
        data['user_id'] = this.user_id;
        return data;
    }
}