class TutorialPurchase{
  bool status;
  String message;
  TutorialPurchase({this.status, this.message});
  factory TutorialPurchase.fromJson(Map<String, dynamic> json) {
    return TutorialPurchase(
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