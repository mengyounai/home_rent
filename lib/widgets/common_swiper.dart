import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:home_rent_master/widgets/common_image.dart';

//轮播图
class CommonSwiper extends StatelessWidget {
  CommonSwiper({Key? key}) : super(key: key);
  final List<String> imgs = [
    "http://image-jishanle2.test.upcdn.net//blog/acg.gy_29Wud4.jpg",
    "http://image-jishanle2.test.upcdn.net//blog/www.acg.gy_13ale4.jpg",
    "http://image-jishanle2.test.upcdn.net//blog/www.acg.gy_01lqb4.jpg",
    "http://image-jishanle2.test.upcdn.net//blog/ACG.GY_03lxS4.jpg"
  ];

  int imgWidth = 500;
  int imgHeight = 225;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width / imgWidth * imgHeight;
    return Container(
        height: height,
        child: ListView(
          children: [
            // SizedBox(
            //   height: 200,
            //   child: Swiper(
            //     itemCount: imgs.length,
            //     itemBuilder: (context, index) {
            //       return Image.network(
            //         imgs[index],
            //         fit: BoxFit.cover,
            //       );
            //     },
            //     pagination: const SwiperPagination(), //轮播图片底下的指示点
            //     control: const SwiperControl(), //左右箭头导航
            //   ),
            // ),
            SizedBox(
              height: 200,
              child: Swiper(
                autoplay: true,
                itemCount: imgs.length,
                itemBuilder: (context, index) {
                  return CommonImage(
                    imgs[index],
                    fit: BoxFit.cover,
                  );
                },
                viewportFraction: 0.7,
                scale: 0.7,
              ),
            ),
            // SizedBox(
            //   height: 200,
            //   child: Swiper(
            //     itemCount: imgs.length,
            //     itemBuilder: (context, index) {
            //       return Image.network(
            //         imgs[index],
            //         fit: BoxFit.cover,
            //       );
            //     },
            //     itemWidth: 300,
            //     layout: SwiperLayout.STACK,
            //   ),
            // ),
            // SizedBox(
            //   height: 200,
            //   child: Swiper(
            //     itemCount: imgs.length,
            //     itemBuilder: (context, index) {
            //       return Image.network(
            //         imgs[index],
            //         fit: BoxFit.cover,
            //       );
            //     },
            //     itemWidth: 300,
            //     itemHeight: 200,
            //     layout: SwiperLayout.TINDER,
            //   ),
            // )
          ],
        ));
  }
}
