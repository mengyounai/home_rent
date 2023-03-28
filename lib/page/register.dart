import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/config.dart';
import 'package:home_rent_master/utils/AesUtil.dart';
import 'package:home_rent_master/utils/EmptyUtils.dart';
import 'package:home_rent_master/utils/common_toast.dart';
import 'package:home_rent_master/utils/dio_http.dart';
import 'package:home_rent_master/widgets/page_content.dart';

import 'package:dio/dio.dart';

//注册
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showPassword = true;
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();

  _registerHander() async {
    var userName = userNameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;
    if (password != repeatPassword) {
      CommonToast.showToast("两次输入密码不一致");
      return;
    }
    if (EmptyUtils.isEmpty(userName) || EmptyUtils.isEmpty(password)) {
      print("userName:$userName");
      print("password:$password");
      CommonToast.showToast("用户名或密码不能为空");
      return;
    }
    print("校验完成");
    const url = '/api/user/register';

    // var response = await DioHttp.dio.get('http://192.168.201.1:8089/test');
    // print(response);
    var params = {
      "username": userName,
      'password': AesUtil.aesEncode(password)
    };

    var res = await DioHttp.dio().post(url, data: params);
    var resJson = json.decode(res.toString());
    var code = resJson['code'];
    if (code == 10200) {
      CommonToast.showToast("注册成功！");
      Get.toNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: ListView(
          children: [
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
              ),
            ),
            TextField(
              controller: repeatPasswordController,
              decoration: InputDecoration(
                labelText: "确认密码",
                hintText: "请输入密码",
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  _registerHander();
                },
                child: Text("注册")),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("已有账号     "),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/login");
                    },
                    child: Text("登录"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white, // 按钮文本颜色
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
