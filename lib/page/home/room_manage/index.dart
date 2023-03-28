import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/page/home/tab_search/dataList.dart';
import 'package:home_rent_master/widgets/room_list_item_widget.dart';

import '../../../widgets/common_float_button.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatButton(
          "发布房源",
          () {
            Get.toNamed("/roomAdd");
          },
        ),
        appBar: AppBar(
          title: const Text("房屋管理"),
          bottom: const TabBar(tabs: [
            Tab(
              text: "空置",
            ),
            Tab(
              text: "已租",
            ),
          ]),
        ),
        body: TabBarView(children: [
          ListView(
            children: dataList.map((item) => RoomListItemWidget(item)).toList(),
          ),
          ListView(
            children: dataList.map((item) => RoomListItemWidget(item)).toList(),
          ),
        ]),
      ),
    );
  }
}
