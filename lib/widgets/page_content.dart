import 'package:flutter/material.dart';
import 'package:get/get.dart';



class PageContent extends StatelessWidget {
  final String name;

  const PageContent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("当前页面:$name"),
        ),
        body: ListView(
          children: [
            TextButton(
                onPressed: () {
                  Get.toNamed("/index");
                },
                child: Text("index")),
            TextButton(
                onPressed: () {
                  Get.toNamed("/login");
                },
                child: Text("login")),
            // TextButton(
            //     onPressed: () {
            //       Get.toNamed("/aaa");
            //     },
            //     child: Text("错误页面")),
            TextButton(
                onPressed: () {
                  Get.toNamed("/detail", arguments: {"roomId": 123});
                },
                child: Text("detail")),
          ],
        ));
  }
}
