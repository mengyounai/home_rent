import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_rent_master/models/user_info.dart';
import 'package:home_rent_master/utils/EmptyUtils.dart';
import 'package:home_rent_master/utils/dio_http.dart';
import 'package:home_rent_master/utils/store.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:dio/dio.dart';

class AuthModel extends Model {
  String _token = '';
  UserInfo? _userInfo;
  String get token => _token;
  UserInfo get userInfo => _userInfo!;

  // ignore: unnecessary_type_check
  bool get isLogin => _token is String && _token != '';

  _getUserInfo() async {
    const url = '/api/user/info';
    // print("访问成功");
    var res = await DioHttp.dio().get(url);
    var resMap = json.decode(res.toString());
    // print(resMap);
    var userInfo = resMap['data']['user'];
    _userInfo = UserInfo.fromJson(userInfo);
    notifyListeners();
    // print("头像为：${_userInfo?.avatar}");
  }

  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    String token = await store.getString(StoreKeys.token);
    if (EmptyUtils.isNotEmpty(token)) {
      // ignore: use_build_context_synchronously
      login(token, context);
    }
  }

  void login(String token, BuildContext context) {
    _token = token;
    _getUserInfo();
    //暂时注释，因为会报错
    // notifyListeners();
  }

  void logout() async {
    Store store = await Store.getInstance();
    await store.setString(StoreKeys.token, '');
    _token = '';
    _userInfo = null;
    notifyListeners();
  }
}
