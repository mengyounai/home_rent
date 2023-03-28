import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_master/page/home/tab_search/dataList.dart';
import 'package:home_rent_master/widgets/common_image.dart';
import 'package:home_rent_master/widgets/common_tag.dart';

class RoomListItemWidget extends StatelessWidget {
  final RoomListItemData data;
  const RoomListItemWidget(this.data, {super.key, required});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/detail", arguments: {"roomId": data.id}),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(children: [
          CommonImage(
            data.imageUrl,
            width: 50,
            height: 100,
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                data.subTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Wrap(children: data.tags.map((item) => CommonTag(item)).toList()),
              Text(
                '${data.price} 元/月',
                style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}
