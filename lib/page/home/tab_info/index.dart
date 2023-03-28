import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/page/home/info/index.dart';

import '../../../widgets/search_bar/index.dart';

class TabInfo extends StatefulWidget {
  final bool showTitle;
  const TabInfo({
    super.key,
    required this.showTitle,
  });

  @override
  State<TabInfo> createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _showTitle = widget.showTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: SearchBar(onSearch: (context) => {Get.toNamed("/search")})),
      body: ListView(children: [
        Info(
          showTitle: _showTitle,
        ),
      ]),
    );
  }
}
