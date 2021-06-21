class ProductData {
  String productId;
  String postId;
  String userId;
  String product;
  String createdAt;
  String title;
  String desc;

  ProductData(
      {this.productId,
        this.postId,
        this.userId,
        this.product,
        this.createdAt,
        this.title,
        this.desc});

  ProductData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    postId = json['post_id'];
    userId = json['user_id'];
    product = json['product'];
    createdAt = json['created_at'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['post_id'] = this.postId;
    data['user_id'] = this.userId;
    data['product'] = this.product;
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    data['desc'] = this.desc;
    return data;
  }
}