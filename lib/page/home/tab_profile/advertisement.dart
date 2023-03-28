import 'package:flutter/material.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
      child: Image.network(
          'http://image-jishanle2.test.upcdn.net//blog/www.acg.gy_26aiq4.jpg'),
    );
  }
}
