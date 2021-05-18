

class DataSkills {
    String id;
    String skills_name;

    DataSkills({this.id, this.skills_name});

    factory DataSkills.fromJson(Map<String, dynamic> json) {
        return DataSkills(
            id: json['id'], 
            skills_name: json['skills_name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['skills_name'] = this.skills_name;
        return data;
    }
}