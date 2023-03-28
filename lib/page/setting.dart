import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/utils/common_toast.dart';
import 'package:home_rent_master/utils/scoped_model_helper.dart';

import '../scoped_model/auto.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                ScopedModelHelper.getModel<AuthModel>(context).logout();
                CommonToast.showToast("已退出登录");
                Get.back();
              },
              child: Text("退出登录")),
        ],
      ),
    );
  }
}
