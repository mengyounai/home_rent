import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/common_image.dart';
import 'index_Recommend_item.dart';

var textStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommendItemWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(data.navigateUrl);
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: (MediaQuery.of(context).size.width - 10.0 * 3) / 2,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  data.title,
                  style: textStyle,
                ),
                Text(
                  data.subTitle,
                  style: textStyle,
                )
              ],
            ),
            CommonImage(
              data.imageUrl,
              width: 55.0,
            )
          ],
        ),
      ),
    );
  }
}
