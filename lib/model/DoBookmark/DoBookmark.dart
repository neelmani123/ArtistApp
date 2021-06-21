class DoBookMark{
  bool status;
  String message;
  int bookmarkCount;

  DoBookMark({this.status, this.message, this.bookmarkCount});

  DoBookMark.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    bookmarkCount = json['bookmark_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['bookmark_count'] = this.bookmarkCount;
    return data;
  }
}