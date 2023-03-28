import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/page/home/info/data.dart';
import 'package:home_rent_master/widgets/common_image.dart';

class ItemWidget extends StatelessWidget {
  final InfoItem data;
  const ItemWidget(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/detail", arguments: {"roomId": data.navigateUrl});
      },
      child: Container(
        height: 100,
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(children: [
          CommonImage(
            data.imageUrl,
            width: 120,
            height: 90,
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.source),
                  Text(data.time),
                ],
              )
            ],
          ))
        ]),
      ),
    );
  }
}
