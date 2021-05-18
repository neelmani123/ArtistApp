class RequestUserLoginModel {
    String message;
    bool status;

    RequestUserLoginModel({ this.message,  this.status});

    factory RequestUserLoginModel.fromJson(Map<String, dynamic> json) {
        return RequestUserLoginModel(
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