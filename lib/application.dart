import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/page/error.dart';
import 'package:home_rent_master/page/home/index.dart';
import 'package:home_rent_master/page/home/room_add/index.dart';
import 'package:home_rent_master/page/home/room_manage/index.dart';
import 'package:home_rent_master/page/home/tab_search/filter_bar/index.dart';
import 'package:home_rent_master/page/loading.dart';
import 'package:home_rent_master/page/login.dart';
import 'package:home_rent_master/page/register.dart';
import 'package:home_rent_master/page/room/detail.dart';
import 'package:home_rent_master/page/setting.dart';
import 'package:home_rent_master/scoped_model/auto.dart';
import 'package:home_rent_master/scoped_model/city.dart';
import 'package:home_rent_master/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(
      model: AuthModel(),
      child: ScopedModel<CityModel>(
        model: CityModel(),
        child: ScopedModel<FilterBarModel>(
          model: FilterBarModel(),
          child: GetMaterialApp(
            title: 'My App',
            initialRoute: '/loading',
            theme: ThemeData(primaryColor: Colors.green),
            routes: {
              '/': (context) => HomePage(),
              '/login': (context) => LoginPage(),
              '/index': (context) => HomePage(),
              '/detail': (context) => Detail(),
              '/register': (context) => Register(),
              '/setting': (context) => SettingPage(),
              '/roomManage': (context) => RoomManagePage(),
              '/roomAdd': (context) => RoomAddPage(),
              '/loading': (context) => LoadingPage(),
            },
            onUnknownRoute: (RouteSettings settings) {
              return GetPageRoute(
                page: () => const error(),
                settings: settings,
              );
            },
          ),
        ),
      ),
    );
  }
}
