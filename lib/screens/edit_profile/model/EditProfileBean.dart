
class EditProfileBean {
    String message;
    bool status;

    EditProfileBean({this.message, this.status});

    factory EditProfileBean.fromJson(Map<String, dynamic> json) {
        return EditProfileBean(
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