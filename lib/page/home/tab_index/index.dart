import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/page/home/info/index.dart';
import 'package:home_rent_master/page/home/tab_index/index_Recommend.dart';
import 'package:home_rent_master/page/home/tab_index/index_navigator.dart';
import 'package:home_rent_master/widgets/common_swiper.dart';
import 'package:home_rent_master/widgets/search_bar/index.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SearchBar(
              shwoLocation: true,
              showMap: true,
              onSearch: (context) => {Get.toNamed("/search")})),
      body: ListView(
        children: [
          CommonSwiper(),
          IndexNavigator(),
          IndexRecommend(),
          Info(),
        ],
      ),
    );
  }
}
