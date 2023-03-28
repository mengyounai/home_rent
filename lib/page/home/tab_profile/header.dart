import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/models/user_info.dart';
import 'package:home_rent_master/scoped_model/auto.dart';
import 'package:home_rent_master/utils/scoped_model_helper.dart';

var loginStyle = TextStyle(fontSize: 20, color: Colors.white);

Widget notLoginBuilder(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(color: Colors.blue),
    height: 95,
    child: Row(children: [
      Container(
        height: 65,
        width: 65,
        margin: EdgeInsets.only(right: 20),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "http://image-jishanle2.test.upcdn.net//blog/acg.gy_18lAr4.jpg"),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 18)),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed('/login');
                },
                child: Text(
                  "登录",
                  style: loginStyle,
                ),
              ),
              Text("/"),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/register');
                },
                child: Text(
                  "注册",
                  style: loginStyle,
                ),
              ),
            ],
          ),
          Text(
            "登录后可以体验更多",
            style: loginStyle,
          ),
        ],
      )
    ]),
  );
}

Widget loginBuilder(BuildContext context) {
  var userInfo = ScopedModelHelper.getModel<AuthModel>(context).userInfo;
  String userName = userInfo.nickname;

  String imgUrl = userInfo.avatar;
  return Container(
    padding: const EdgeInsets.only(left: 20),
    decoration: const BoxDecoration(color: Colors.blue),
    height: 95,
    child: Row(children: [
      Container(
        height: 65,
        width: 65,
        margin: const EdgeInsets.only(right: 20),
        child: CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 18)),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Get.toNamed('/login');
                },
                child: Text(
                  userName,
                  style: loginStyle,
                ),
              ),
              // Text("/"),
              // GestureDetector(
              //   onTap: () {
              //     Get.toNamed('/register');
              //   },
              //   child: Text(
              //     "注册",
              //     style: loginStyle,
              //   ),
              // ),
            ],
          ),
          Text(
            "查看个人信息",
            style: loginStyle,
          ),
        ],
      )
    ]),
  );
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    return isLogin ? loginBuilder(context) : notLoginBuilder(context);
  }
}
