import 'package:home_rent_master/models/general_type.dart';
import 'package:home_rent_master/page/home/tab_search/filter_bar/data.dart';
import 'package:scoped_model/scoped_model.dart';

class CityModel extends Model {
  GeneralType? _city;

  set city(GeneralType? data) {
    _city = data;
    notifyListeners();
  }

  GeneralType? get city => _city;
}
