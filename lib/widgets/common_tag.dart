import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;

  const CommonTag.origin(this.title,
      {super.key,
      this.color = Colors.black,
      this.backgroundColor = Colors.grey});
  factory CommonTag(String title) {
    switch (title) {
      case '近地铁':
        return CommonTag.origin(
          title,
          color: Colors.white,
          backgroundColor: Colors.red,
        );
      case '集中供暖':
        return CommonTag.origin(
          title,
          color: Colors.amber,
          backgroundColor: Colors.red,
        );
      case '随时看房':
        return CommonTag.origin(
          title,
          color: Colors.green,
          backgroundColor: Colors.red,
        );
      case '新上':
        return CommonTag.origin(
          title,
          color: Colors.blue,
          backgroundColor: Colors.red,
        );
      default:
        return CommonTag.origin(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 10, color: color),
      ),
    );
  }
}
