import 'package:home_rent_master/models/general_type.dart';

class Config {
  // ignore: constant_identifier_names
  static const CommonIcon = 'MyIcon';
  // ignore: constant_identifier_names
  // static const BaseUrl = 'http://192.168.201.1:8089';
  static const BaseUrl = 'http://192.168.220.230:8089';
  static List<GeneralType> availableCitys = [
    GeneralType("北京", "1"),
    GeneralType("上海", "2"),
    GeneralType("浙江", "3"),
    GeneralType("广州", "4"),
    GeneralType("四川", "5"),
    GeneralType("重庆", "6"),
    GeneralType("深圳", "7"),
    GeneralType("杭州", "8"),
  ];
}
