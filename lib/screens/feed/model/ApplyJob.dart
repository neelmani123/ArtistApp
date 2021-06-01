class ApplyJob
{
String status;
String message;
ApplyJob({this.status,this.message});
factory ApplyJob.fromJson(Map<String, dynamic> json) {
  return ApplyJob(
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