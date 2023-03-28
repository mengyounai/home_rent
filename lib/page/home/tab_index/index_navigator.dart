import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/widgets/common_image.dart';
import './index_navigator_item.dart';

class IndexNavigator extends StatelessWidget {
  const IndexNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navigatorItemList
              .map((item) => InkWell(
                  onTap: () {
                    item.onTap(context);
                  },
                  child: Column(
                    children: [
                      CommonImage(
                        item.imageUrl,
                        width: 40,
                      ),
                      Text(item.title),
                    ],
                  )))
              .toList()),
    );
  }
}
