

class SkillsName {
    String id;
    String name;

    SkillsName({this.id, this.name});

    factory SkillsName.fromJson(Map<String, dynamic> json) {
        return SkillsName(
            id: json['id'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}