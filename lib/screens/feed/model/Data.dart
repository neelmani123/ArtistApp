

import 'package:artist_icon/screens/feed/model/CommentData.dart';

class Data {
    String comment_count;
    List<CommentData> comment_data;
    String created_at;
    String file_url;
    String id;
    int is_like;
    String like_count;
    String media_type;
    String status;
    String text;
    String user_id;
    String user_image;
    String user_name;

    Data({this.comment_count, this.comment_data, this.created_at, this.file_url, this.id, this.is_like, this.like_count, this.media_type, this.status, this.text, this.user_id, this.user_image, this.user_name});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            comment_count: json['comment_count'], 
            comment_data: json['comment_data'] != null ? (json['comment_data'] as List).map((i) => CommentData.fromJson(i)).toList() : null, 
            created_at: json['created_at'], 
            file_url: json['file_url'], 
            id: json['id'], 
            is_like: json['is_like'], 
            like_count: json['like_count'], 
            media_type: json['media_type'], 
            status: json['status'], 
            text: json['text'], 
            user_id: json['user_id'], 
            user_image: json['user_image'], 
            user_name: json['user_name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['comment_count'] = this.comment_count;
        data['created_at'] = this.created_at;
        data['file_url'] = this.file_url;
        data['id'] = this.id;
        data['is_like'] = this.is_like;
        data['like_count'] = this.like_count;
        data['media_type'] = this.media_type;
        data['status'] = this.status;
        data['text'] = this.text;
        data['user_id'] = this.user_id;
        data['user_image'] = this.user_image;
        data['user_name'] = this.user_name;
        if (this.comment_data != null) {
            data['comment_data'] = this.comment_data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}