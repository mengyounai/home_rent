import 'package:flutter/material.dart';

//错误页
class error extends StatelessWidget {
  const error({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("404")),
      body: Center(child: Text("您访问的页面不存在")),
    );
  }
}
