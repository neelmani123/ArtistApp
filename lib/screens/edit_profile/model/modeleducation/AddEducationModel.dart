class AddEducationModel {
    String message;
    bool status;

    AddEducationModel({this.message, this.status});

    factory AddEducationModel.fromJson(Map<String, dynamic> json) {
        return AddEducationModel(
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