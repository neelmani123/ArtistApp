class CommentData {
  String commentId;
  String postId;
  String userId;
  String name;
  String profileImage;
  String comments;

  CommentData(
      {this.commentId,
        this.postId,
        this.userId,
        this.name,
        this.profileImage,
        this.comments});

  CommentData.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    postId = json['post_id'];
    userId = json['user_id'];
    name = json['name'];
    profileImage = json['profile_image'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_id'] = this.commentId;
    data['post_id'] = this.postId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['profile_image'] = this.profileImage;
    data['comments'] = this.comments;
    return data;
  }
}
