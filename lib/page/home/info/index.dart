import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/page/home/info/data.dart';
import 'package:home_rent_master/page/home/info/data_widget.dart';

class Info extends StatelessWidget {
  final bool showTitle;
  final List<InfoItem> dataList;

  const Info({super.key, this.showTitle = true, this.dataList = infoData});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (showTitle)
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            "最新咨询",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      Column(
        children: dataList.map((item) => ItemWidget(item)).toList(),
        
      )
    ]);
  }
}
