class UserLanguages {
  String id;
  String languages;
  String isRead;
  String isWrite;
  String isSpeak;
  String createdAt;
  Null updatedAt;

  UserLanguages(
      {this.id,
        this.languages,
        this.isRead,
        this.isWrite,
        this.isSpeak,
        this.createdAt,
        this.updatedAt});

  UserLanguages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languages = json['languages'];
    isRead = json['is_read'];
    isWrite = json['is_write'];
    isSpeak = json['is_speak'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['languages'] = this.languages;
    data['is_read'] = this.isRead;
    data['is_write'] = this.isWrite;
    data['is_speak'] = this.isSpeak;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

