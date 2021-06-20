class UserWork {
  String id;
  String position;
  String companyName;
  String currentlyWorkHere;
  String startDate;
  String endDate;
  String companyLocation;
  String userId;
  String createdAt;
  String status;

  UserWork(
      {this.id,
        this.position,
        this.companyName,
        this.currentlyWorkHere,
        this.startDate,
        this.endDate,
        this.companyLocation,
        this.userId,
        this.createdAt,
        this.status});

  UserWork.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
    companyName = json['company_name'];
    currentlyWorkHere = json['currently_work_here '];
    startDate = json['start_date'];
    endDate = json['end_date'];
    companyLocation = json['company_location'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    data['company_name'] = this.companyName;
    data['currently_work_here '] = this.currentlyWorkHere;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['company_location'] = this.companyLocation;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}
