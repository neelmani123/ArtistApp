
class UserLanguage {
    String created_at;
    String id;
    String is_read;
    String is_speak;
    String is_write;
    String languages;
    String updated_at;

    UserLanguage({this.created_at, this.id, this.is_read, this.is_speak, this.is_write, this.languages, this.updated_at});

    factory UserLanguage.fromJson(Map<String, dynamic> json) {
        return UserLanguage(
            created_at: json['created_at'], 
            id: json['id'], 
            is_read: json['is_read'], 
            is_speak: json['is_speak'], 
            is_write: json['is_write'], 
            languages: json['languages'], 
            updated_at: json['updated_at'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['is_read'] = this.is_read;
        data['is_speak'] = this.is_speak;
        data['is_write'] = this.is_write;
        data['languages'] = this.languages;
        data['updated_at'] = this.updated_at;
        return data;
    }
}