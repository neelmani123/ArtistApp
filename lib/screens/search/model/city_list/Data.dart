

class DataCity {
    String city;
    String id;

    DataCity({this.city, this.id});

    factory DataCity.fromJson(Map<String, dynamic> json) {
        return DataCity(
            city: json['city'], 
            id: json['id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['city'] = this.city;
        data['id'] = this.id;
        return data;
    }
}