import 'package:artist_icon/model/MyFeedModel/MyFeedProduct.dart';

class Data {
  String id;
  String userId;
  String userName;
  String userImage;
  String fileUrl;
  String text;
  String status;
  String likeCount;
  String commentCount;
  String createdAt;
  String mediaType;
  String isTutorial;
  String price;
  int isLike;
  int isBookmark;
  List<Null> commentData;
  List<ProductData> productData;

  Data(
      {this.id,
        this.userId,
        this.userName,
        this.userImage,
        this.fileUrl,
        this.text,
        this.status,
        this.likeCount,
        this.commentCount,
        this.createdAt,
        this.mediaType,
        this.isTutorial,
        this.price,
        this.isLike,
        this.isBookmark,
        this.commentData,
        this.productData});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    userImage = json['user_image'];
    fileUrl = json['file_url'];
    text = json['text'];
    status = json['status'];
    likeCount = json['like_count'];
    commentCount = json['comment_count'];
    createdAt = json['created_at'];
    mediaType = json['media_type'];
    isTutorial = json['is_tutorial'];
    price = json['price'];
    isLike = json['is_like'];
    isBookmark = json['is_bookmark'];
    /*if (json['comment_data'] != null) {
      commentData = new List<Null>();
      json['comment_data'].forEach((v) {
        commentData.add(new Null.fromJson(v));
      });
    }*/
    if (json['product_data'] != null) {
      productData = new List<ProductData>();
      json['product_data'].forEach((v) {
        productData.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_image'] = this.userImage;
    data['file_url'] = this.fileUrl;
    data['text'] = this.text;
    data['status'] = this.status;
    data['like_count'] = this.likeCount;
    data['comment_count'] = this.commentCount;
    data['created_at'] = this.createdAt;
    data['media_type'] = this.mediaType;
    data['is_tutorial'] = this.isTutorial;
    data['price'] = this.price;
    data['is_like'] = this.isLike;
    data['is_bookmark'] = this.isBookmark;
    /*if (this.commentData != null) {
      data['comment_data'] = this.commentData.map((v) => v.toJson()).toList();
    }*/
    if (this.productData != null) {
      data['product_data'] = this.productData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
