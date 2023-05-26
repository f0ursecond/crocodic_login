import 'package:flutter/material.dart';

class TxtBack extends StatelessWidget {
  const TxtBack({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);

  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: press,
        child: Text(text),
      ),
    );
  }
}
