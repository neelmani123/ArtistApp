

class Data {
    String created_at;
    String id;
    String img;
    String name;
    String status;

    Data({this.created_at, this.id, this.img, this.name, this.status});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            created_at: json['created_at'], 
            id: json['id'], 
            img: json['img'], 
            name: json['name'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['img'] = this.img;
        data['name'] = this.name;
        data['status'] = this.status;
        return data;
    }
}