class CreateJobPostModel{
  String status;
  String message;
  CreateJobPostModel({this.status,this.message});
  factory CreateJobPostModel.fromJson(Map<String, dynamic> json) {
    return CreateJobPostModel(
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}