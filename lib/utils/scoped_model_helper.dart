import 'package:home_rent_master/config.dart';
import 'package:home_rent_master/scoped_model/city.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class ScopedModelHelper {
  static T getModel<T extends Model>(BuildContext context) {
    return ScopedModel.of<T>(context, rebuildOnChange: true);
  }

  static String? getAreaId(BuildContext context) {
    return ScopedModelHelper.getModel<CityModel>(context).city?.id;
  }
}
