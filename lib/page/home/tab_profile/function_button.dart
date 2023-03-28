import 'package:flutter/material.dart';
import 'function_button_data.dart';
import 'function_button_widget.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 1,
      spacing: 1,
      children: list.map((item) => FunctionButtonWidget(data: item)).toList(),
    );
  }
}
