import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_rent_master/scoped_model/auto.dart';
import 'package:home_rent_master/utils/common_toast.dart';
import 'package:home_rent_master/utils/scoped_model_helper.dart';
import 'package:home_rent_master/utils/store.dart';

import '../config.dart';

class DioHttp {
  Dio? _client;
  late BuildContext context;

  static Dio dio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: Config.BaseUrl,
        connectTimeout: Duration(seconds: 7),
        receiveTimeout: Duration(seconds: 10),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Credentials": true,
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "GET, HEAD, POST, OPTIONS"
        },
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        Store prefs = await Store.getInstance();
        String? token = await prefs.getString(StoreKeys.token);
        if (token != null) {
          options.headers['token'] = '$token';
        }
        return handler.next(options);
      },
    ));

    return dio;
  }

  // static Dio dio = Dio(
  //   BaseOptions(
  //     baseUrl: Config.BaseUrl,
  //     connectTimeout: Duration(seconds: 15),
  //     receiveTimeout: Duration(seconds: 10),
  //     headers: {
  //       "Access-Control-Allow-Origin": "*",
  //       "Access-Control-Allow-Credentials": true,
  //       "Access-Control-Allow-Headers":
  //           "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  //       "Access-Control-Allow-Methods": "GET, HEAD, POST, OPTIONS"
  //     },
  //   ),
  // );

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    if (_client == null || context != this.context) {
      this.context = context;
      var options = BaseOptions(
          // baseUrl: Config.BaseUrl,
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 3),
          extra: {'context': context});
      var client = Dio(options);
      client.interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) {
        return handler.next(options); //continue
        // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      }, onResponse: (response, handler) {
        var resp = response.data;
        // 拦截到错误, 弹框提示
        if (resp['data']['code'] != 0) {
          CommonToast.showToast(resp['data']['message'] ?? '内部错误');
          return; // 不继续执行流程
        }
        return handler.next(response); // continue
      }, onError: (DioError e, handler) {
        return handler.next(e); //continue
        // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      }));

      _client = client;
    }
  }

  // 封装 Get 请求
  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client!.get(path, queryParameters: params, options: options);
  }

  // 封装 Post 请求
  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client!.post(path, data: params, options: options);
  }
}
