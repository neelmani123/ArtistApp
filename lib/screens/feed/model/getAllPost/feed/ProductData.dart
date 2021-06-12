

class ProductData {
    String created_at;
    String desc;
    String post_id;
    String product;
    String product_id;
    String title;
    String user_id;

    ProductData({this.created_at, this.desc, this.post_id, this.product, this.product_id, this.title, this.user_id});

    factory ProductData.fromJson(Map<String, dynamic> json) {
        return ProductData(
            created_at: json['created_at'], 
            desc: json['desc'], 
            post_id: json['post_id'], 
            product: json['product'], 
            product_id: json['product_id'], 
            title: json['title'], 
            user_id: json['user_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['desc'] = this.desc;
        data['post_id'] = this.post_id;
        data['product'] = this.product;
        data['product_id'] = this.product_id;
        data['title'] = this.title;
        data['user_id'] = this.user_id;
        return data;
    }
}