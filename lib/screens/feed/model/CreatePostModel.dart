class CreatepostModel{
  String status;
  String message;
  int postId;

  CreatepostModel({this.status,this.message,this.postId});
  factory CreatepostModel.fromJson(Map<String, dynamic> json) {
    return CreatepostModel(
      message: json['message'],
      status: json['status'],
      postId: json['post_id']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['post_id']=this.postId;
    return data;
  }
}