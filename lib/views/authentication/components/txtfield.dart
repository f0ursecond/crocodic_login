import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  final String text;
  final Icon iconcuy;
  const TxtField({
    Key? key,
    required this.text,
    required this.iconcuy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: iconcuy,
          border: const OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}
