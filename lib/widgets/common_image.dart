import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter/material.dart';

final networkUrlReg = RegExp("^http");
final loaclUrlReg = RegExp("^images");

class CommonImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CommonImage(this.src, {super.key, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    if (networkUrlReg.hasMatch(src)) {
      return Image(
        width: width,
        height: height,
        fit: fit,
        image: AdvancedNetworkImage(src,
            useDiskCache: true,
            cacheRule: CacheRule(maxAge: Duration(days: 7)),
            timeoutDuration: Duration(seconds: 20)),
      );
    }
    if (loaclUrlReg.hasMatch(src)) {
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
      );
    }
    assert(false, "图片地址不合法");
    return Container();
  }
}
