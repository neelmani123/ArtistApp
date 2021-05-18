
class UserWork {
    String company_location;
    String company_name;
    String created_at;
    String currently_work_here;
    String end_date;
    String id;
    String position;
    String start_date;
    String status;
    String user_id;

    UserWork({this.company_location, this.company_name, this.created_at, this.currently_work_here, this.end_date, this.id, this.position, this.start_date, this.status, this.user_id});

    factory UserWork.fromJson(Map<String, dynamic> json) {
        return UserWork(
            company_location: json['company_location'], 
            company_name: json['company_name'], 
            created_at: json['created_at'], 
            currently_work_here: json['currently_work_here'], 
            end_date: json['end_date'], 
            id: json['id'], 
            position: json['position'], 
            start_date: json['start_date'], 
            status: json['status'], 
            user_id: json['user_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['company_location'] = this.company_location;
        data['company_name'] = this.company_name;
        data['created_at'] = this.created_at;
        data['currently_work_here'] = this.currently_work_here;
        data['end_date'] = this.end_date;
        data['id'] = this.id;
        data['position'] = this.position;
        data['start_date'] = this.start_date;
        data['status'] = this.status;
        data['user_id'] = this.user_id;
        return data;
    }
}