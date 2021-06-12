

class CommentData {
    String comment_id;
    String comments;
    String name;
    String post_id;
    String profile_image;
    String user_id;

    CommentData({this.comment_id, this.comments, this.name, this.post_id, this.profile_image, this.user_id});

    factory CommentData.fromJson(Map<String, dynamic> json) {
        return CommentData(
            comment_id: json['comment_id'], 
            comments: json['comments'], 
            name: json['name'], 
            post_id: json['post_id'], 
            profile_image: json['profile_image'], 
            user_id: json['user_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['comment_id'] = this.comment_id;
        data['comments'] = this.comments;
        data['name'] = this.name;
        data['post_id'] = this.post_id;
        data['profile_image'] = this.profile_image;
        data['user_id'] = this.user_id;
        return data;
    }
}