import 'package:flutter/material.dart';

class txtField extends StatelessWidget {
  final String text;
  const txtField({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          // prefixIcon: iconcuy,
          border: OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}
