import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  final String text;
  final Icon iconcuy;
  final TextEditingController controller;
  const TxtField({
    Key? key,
    required this.text,
    required this.iconcuy,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: iconcuy,
          border: const OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}
