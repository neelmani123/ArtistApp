class DataTemp {
    String id;
    String img;
    String type;

    DataTemp({this.id, this.img, this.type});

    factory DataTemp.fromJson(Map<String, dynamic> json) {
        return DataTemp(
            id: json['id'], 
            img: json['img'], 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['img'] = this.img;
        data['type'] = this.type;
        return data;
    }
}