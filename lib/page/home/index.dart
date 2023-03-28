import 'package:flutter/material.dart';
import 'package:home_rent_master/page/home/tab_index/index.dart';
import 'package:home_rent_master/page/home/tab_info/index.dart';
import 'package:home_rent_master/page/home/tab_profile/index.dart';
import 'package:home_rent_master/page/home/tab_search/index.dart';
import 'package:home_rent_master/widgets/page_content.dart';

List pageViewList = [
  TabIndex(),
  //  PageContent(name: "我的"),
  TabSearch(),
  TabInfo(
    showTitle: false,
  ),
  TabProfile(),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List _page = pageViewList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (value) => setState(() {
                _currentIndex = value;
              }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(
                icon: Icon(Icons.type_specimen), label: "搜索"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "咨询"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
          ]),
    );
  }
}
