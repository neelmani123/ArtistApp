class DoLike{
  bool status;
  String message;
  int likeCount;

  DoLike({this.status, this.message, this.likeCount});

  DoLike.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    likeCount = json['like_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['like_count'] = this.likeCount;
    return data;
  }

}