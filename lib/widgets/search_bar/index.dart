import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/config.dart';
import 'package:home_rent_master/models/general_type.dart';
import 'package:home_rent_master/scoped_model/city.dart';
import 'package:home_rent_master/utils/common_toast.dart';
import 'package:home_rent_master/utils/scoped_model_helper.dart';
import 'package:home_rent_master/utils/store.dart';

class SearchBar extends StatefulWidget {
  final bool? shwoLocation;
  final Function? goBackCallback;
  final String? inputValue;
  final String? defaultInputValue;
  final Function? onCancel;
  final bool? showMap;
  final Function(BuildContext context) onSearch;
  final ValueChanged<String>? onSearchSubmit;

  const SearchBar(
      {Key? key,
      this.shwoLocation,
      this.goBackCallback,
      this.inputValue,
      this.defaultInputValue,
      this.onCancel,
      this.showMap,
      required this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = ' ';
  late TextEditingController _controller;
  late FocusNode _focus;
  Function? _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = ' ';
    });
  }

  _saveCity(GeneralType city) async {
    if (city == null) return;
    print("city3:$city");
    ScopedModelHelper.getModel<CityModel>(context).city = city;
    var store = await Store.getInstance();
    var cityString = json.encode(city.toJson(city));
    print("cityString:$cityString");
    store.setString(StoreKeys.city, cityString);
  }

  _changeLocation() async {
    var result = await CityPickers.showCitiesSelector(
        context: context,
        theme: ThemeData(
          primaryColor: Colors.green,
        ));

    String? cityName = result?.cityName;
    print("cityName:$cityName");
    if (null == cityName) return;

    var city = Config.availableCitys.firstWhereOrNull(
      (city) => cityName.startsWith(city.name),
    );

    print("city:$city");

    if (null == city) {
      CommonToast.showToast("该城市暂未开通");
      return;
    }

    _saveCity(city);
  }

  _getCity() async {
    var store = await Store.getInstance();
    var cityString = await store.getString(StoreKeys.city);
    print("cityString:${cityString}");
    if (null == cityString) return;
    var cityMap = json.decode(cityString); // 将字符串转换为 Map 对象
    var city = GeneralType.fromJson(cityMap); // 解析 Map 对象为 GeneralType 对象
    print("city:$city");
    ScopedModelHelper.getModel<CityModel>(context).city = city;
  }

  @override
  void initState() {
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var city = ScopedModelHelper.getModel<CityModel>(context).city;
    if (null == city) {
      city = Config.availableCitys.first;
      _getCity();
    }
    return Container(
      child: Row(
        children: [
          if (widget.shwoLocation != null)
            GestureDetector(
              onTap: () {
                _changeLocation();
              },
              child: Row(
                children: [
                  Icon(Icons.room, color: Colors.green, size: 20),
                  Text(city.name,
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ],
              ),
            ),
          if (widget.goBackCallback != null)
            GestureDetector(
              // onTap: widget.goBackCallback,
              child: Icon(
                Icons.chevron_left,
                color: Colors.black87,
              ),
            ),
          Expanded(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(18)),
              padding: EdgeInsets.only(left: 8, top: 2),
              child: TextField(
                focusNode: _focus,
                textInputAction: TextInputAction.search,
                onTap: () {
                  if (null == widget.onSearchSubmit) {
                    _focus.unfocus();
                  }

                  widget.onSearch(context);
                },
                //删除文本
                controller: _controller,

                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: -2),
                  hintText: '请输入搜索词',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.grey,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _onClean();
                    },
                    child: Icon(
                      Icons.clear,
                      size: 24,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 4),
          if (widget.onCancel != null)
            GestureDetector(
              // onTap: widget.goBackCallback,
              child: Text(
                '取消',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
