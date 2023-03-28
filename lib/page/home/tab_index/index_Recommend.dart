import 'package:flutter/material.dart';
import 'package:home_rent_master/page/home/tab_index/index_Recommend_item.dart';
import 'package:home_rent_master/page/home/tab_index/index_Recommend_item_widget.dart';
import 'index_Recommend_item.dart';

class IndexRecommend extends StatelessWidget {
  final List<IndexRecommendItem>? dataList;
  const IndexRecommend({Key? key, this.dataList = indexRecommendData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('房屋推荐',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: AutofillHints.countryName)),
            Text('更多', style: TextStyle(color: Colors.black)),
          ],
        ),
        Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            children: dataList!
                .map((item) => IndexRecommendItemWidget(item))
                .toList()),
      ],
    );
  }
}
