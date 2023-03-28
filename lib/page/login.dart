import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/scoped_model/auto.dart';
import 'package:home_rent_master/utils/AesUtil.dart';
import 'package:home_rent_master/utils/EmptyUtils.dart';
import 'package:home_rent_master/utils/common_toast.dart';
import 'package:home_rent_master/utils/dio_http.dart';
import 'package:home_rent_master/utils/scoped_model_helper.dart';
import 'package:home_rent_master/utils/store.dart';
import 'package:home_rent_master/widgets/page_content.dart';

//登录
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  _loginHander() async {
    var userName = usernameController.text;
    var password = passwordController.text;

    if (EmptyUtils.isEmpty(userName) || EmptyUtils.isEmpty(password)) {
      print("userName:$userName");
      print("password:$password");
      CommonToast.showToast("用户名或密码不能为空");
      return;
    }

    const url = '/api/user/login';
    // var response = await DioHttp.dio.get('http://192.168.201.1:8089/test');
    // print(response);
    var params = {
      "username": userName,
      'password': AesUtil.aesEncode(password)
    };

    try {
      var res = await DioHttp.dio().post(url, data: params);

      var resJson = json.decode(res.toString());
      print(resJson);
      var code = resJson['code'];
      print("code:$code");
      if (code != 10200) {
        CommonToast.showToast(resJson['message']);
        return;
      }
      if (code == 10200) {
        String token = resJson['data']['token'];
        Store store = await Store.getInstance();
        await store.setString(StoreKeys.token, token);

        // ignore: use_build_context_synchronously
        ScopedModelHelper.getModel<AuthModel>(context).login(token, context);
        CommonToast.showToast("登录成功！");

        Get.back();
      }
    } catch (e) {
      print(e);
      print("连接超时");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: ListView(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: !showPassword,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                suffixIcon: IconButton(
                  icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  _loginHander();
                },
                child: Text("登录")),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("还没有账号     "),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/register");
                    },
                    child: Text("注册"),
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
