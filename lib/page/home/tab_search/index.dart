import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/page/home/tab_search/dataList.dart';
import 'package:home_rent_master/page/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:home_rent_master/page/home/tab_search/filter_bar/index.dart';
import 'package:home_rent_master/widgets/room_list_item_widget.dart';
import 'package:home_rent_master/widgets/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({super.key});

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      appBar: AppBar(
          elevation: 0,
          title: SearchBar(
              shwoLocation: true,
              showMap: true,
              onSearch: (context) => {Get.toNamed("/search")})),
      body: Column(children: [
        SizedBox(
          height: 40,
          child: FilterBar(
            onChange: (data) {
              // print('q');
            },
          ),
          // child: Text('q'),
        ),
        Expanded(
            child: ListView(
                children:
                    dataList.map((item) => RoomListItemWidget(item)).toList()))
      ]),
    );
  }
}
