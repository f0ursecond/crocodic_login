import 'package:flutter/material.dart';

class passField extends StatefulWidget {
  final String text;
  const passField({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<passField> createState() => _passFieldState();
}

class _passFieldState extends State<passField> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: obsecureText,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obsecureText = !obsecureText;
              });
            },
            icon: Icon(
              obsecureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
          border: OutlineInputBorder(),
          labelText: widget.text,
        ),
      ),
    );
  }
}
