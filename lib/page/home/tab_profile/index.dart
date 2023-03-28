import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/page/home/info/index.dart';
import 'package:home_rent_master/page/home/tab_profile/header.dart';

import 'advertisement.dart';
import 'function_button.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("我的"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed("/setting");
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: ListView(
          children: [
            Header(),
            FunctionButton(),
            Advertisement(),
            Info(
              showTitle: true,
            ),
          ],
        ));
  }
}
