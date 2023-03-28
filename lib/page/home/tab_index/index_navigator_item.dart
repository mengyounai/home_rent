import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexNavigatorItem {
  final String title;
  final String imageUrl;
  Function(BuildContext context) onTap;

  IndexNavigatorItem(this.title, this.imageUrl, this.onTap);
}

List<IndexNavigatorItem> navigatorItemList = [
  IndexNavigatorItem(
      "房子", "images/icon/shangdian.png", (context) => {Get.toNamed("/login")}),
  IndexNavigatorItem(
      "身子", "images/icon/shezhi.png", (context) => {Get.toNamed("/index")}),
  IndexNavigatorItem(
      "信息", "images/icon/xinxi.png", (context) => {Get.toNamed("/login")}),
  IndexNavigatorItem(
      "图片", "images/icon/tupian.png", (context) => {Get.toNamed("/login")}),
];
