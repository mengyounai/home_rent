import 'package:flutter/material.dart';
import '../config.dart';
import 'common_check_button.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);

  // const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe624, false),
  RoomApplianceItem('洗衣机', 0xe90d, false),
  RoomApplianceItem('空调', 0xe90e, false),
  RoomApplianceItem('天然气', 0xe625, false),
  RoomApplianceItem('冰箱', 0xe90b, false),
  RoomApplianceItem('暖气', 0xe627, false),
  RoomApplianceItem('电视', 0xf0099, false),
  RoomApplianceItem('热水器', 0xe626, false),
  RoomApplianceItem('宽带', 0xe90f, false),
  RoomApplianceItem('沙发', 0xe60d, false),
];

class RoomAppliance extends StatefulWidget {
//组件参数
  final ValueChanged<List<RoomApplianceItem>> onChange;

  const RoomAppliance({Key? key, required this.onChange}) : super(key: key);

  @override
  _RoomApplianceState createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = _dataList;
  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 30.0,
        children: list
            .map((item) => GestureDetector(
                  onTap: () {
                    //自身组件自改变
                    setState(() {
                      list = list
                          .map((innerItem) => innerItem == item
                              ? RoomApplianceItem(
                                  item.title, item.iconPoint, !item.isChecked)
                              : innerItem)
                          .toList();
                    });
                    //  同时通知父级
                    if (null != widget.onChange) {
                      widget.onChange(list);
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(children: <Widget>[
                      Icon(
                          //字体图标的使用
                          IconData(item.iconPoint,
                              fontFamily: Config.CommonIcon),
                          size: 40.0),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(item.title),
                      ),
                      CommonCheckButton(item.isChecked)
                    ]),
                  ),
                ))
            .toList());
  }
}

class RoomApplianceList extends StatefulWidget {
  final List<String>? list;

  const RoomApplianceList({Key? key, required this.list}) : super(key: key);

  @override
  _RoomApplianceListState createState() => _RoomApplianceListState();
}

class _RoomApplianceListState extends State<RoomApplianceList> {
  @override
  Widget build(BuildContext context) {
    var showList =
        _dataList.where((item) => widget.list!.contains(item.title)).toList();

    if (showList.isEmpty) {
      return Container(
        padding: const EdgeInsets.only(left: 10),
        child: const Text('暂无房源配置信息'),
      );
    }
    return Wrap(
        runSpacing: 30.0,
        children: showList
            .map((item) => SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Column(children: [
                    Icon(
                        //字体图标的使用
                        IconData(
                          item.iconPoint,
                          fontFamily: Config.CommonIcon,
                        ),
                        size: 40.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(item.title),
                    ),
                    // CommonCheckButton(item.isChecked)
                  ]),
                ))
            .toList());
  }
}
