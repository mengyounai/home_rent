import 'package:get/get.dart';
import 'package:home_rent_master/utils/scoped_model_helper.dart';

import '../../../scoped_model/auto.dart';

class FunctionButtonItem {
  final String imageUrl;
  final String title;
  final Function? onTapHandle;
  FunctionButtonItem(this.imageUrl, this.title, this.onTapHandle);
}

final List<FunctionButtonItem> list = [
  FunctionButtonItem('images/icon/shangdian.png', "看房记录", () {}),
  FunctionButtonItem('images/icon/shezhi.png', '我的订单', null),
  FunctionButtonItem('images/icon/xinxi.png', '我的收藏', null),
  FunctionButtonItem('images/icon/tupian.png', '身份认证', null),
  FunctionButtonItem('images/icon/dqgl.png', '联系我们', null),
  FunctionButtonItem('images/icon/dw.png', '电子合同', null),
  FunctionButtonItem('images/icon/sousuo.png', '钱包', null),
  FunctionButtonItem('images/icon/sousuo.png', "房屋管理", (context) {
    bool isLogin =
        ScopedModelHelper.getModel<AuthModel>(context).isLogin; //假设先设置未登录
    if (isLogin) {
      Get.toNamed('/roomManage');
      return;
    }
    Get.toNamed('/login');
  })
];
