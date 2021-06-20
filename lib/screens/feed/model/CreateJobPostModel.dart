class CreateJobPostModel{
  bool status;
  String message;
  CreateJobPostModel({this.status,this.message});

  factory CreateJobPostModel.fromJson(Map<String, dynamic> json) {
    return CreateJobPostModel(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, String> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;

    return data;
  }
}