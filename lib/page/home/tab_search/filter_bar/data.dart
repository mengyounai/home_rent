//结果数据类型
import 'package:home_rent_master/models/general_type.dart';

class FilterBarResult {
  final String areaId;
  final String priceId;
  final String rentTypeId;
  final List<String> moreIds;

  FilterBarResult(
      {required this.areaId,
      required this.priceId,
      required this.rentTypeId,
      required this.moreIds,
      required String priceTypeId,
      required List<String> moreId});
}

List<GeneralType> areaList = [
  GeneralType('上海', '11'),
  GeneralType('北京', '22'),
];
List<GeneralType> priceList = [
  GeneralType('价格1', 'bb'),
  GeneralType('价格2', 'aa'),
];
List<GeneralType> rentTypeList = [
  GeneralType('出租类型1', 'bb'),
  GeneralType('出租类型2', '22'),
];
List<GeneralType> roomTypeList = [
  GeneralType('房屋类型1', '11'),
  GeneralType('房屋类型2', '22'),
];
List<GeneralType> orientedList = [
  GeneralType('方向1', '99'),
  GeneralType('方向2', 'cc'),
];
List<GeneralType> floorList = [
  GeneralType('楼层1', 'aa'),
  GeneralType('楼层2', 'bb'),
];
