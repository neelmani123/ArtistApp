import 'package:artist_icon/screens/api_helper/cached_image.dart';
import 'package:artist_icon/screens/home_page/template_listModel/Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeBanner extends StatefulWidget{
  List<DataTemp>  all_banners;
  HomeBanner({Key key, this.all_banners}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeBannerState();
  }

}
class HomeBannerState extends State<HomeBanner>{
  List<DataTemp> all_banners=[];

  @override
  void initState() {
    super.initState();
    all_banners=widget.all_banners;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Swiper(
        duration: 500,
        itemWidth: double.infinity,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(left: 10,bottom: 10),
          builder: SwiperPagination.dots,
        ),
        itemCount: widget.all_banners.length,
        itemBuilder: (BuildContext context, int index) {

          return InkWell(
            onTap: (){
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ProductListPage(
              //         subcategory:"",
              //         text: "",
              //         brand: widget.all_banners[index].brand,
              //         size: widget.all_banners[index].size,
              //         min_price: widget.all_banners[index].min_price,
              //         max_price: widget.all_banners[index].max_price,
              //         category: widget.all_banners[index].category,
              //         offer: widget.all_banners[index].offer,
              //
              //       ),
              //     ));
            },
            child: CachedImage(
              url: widget.all_banners[index].img,
            ),
          );
        },
        // viewportFraction: 0.8,
        // scale: 0.9,
        autoplay: true,
      ),

      height: 200,
    );
  }

}