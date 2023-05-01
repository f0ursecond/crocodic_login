import 'package:flutter/material.dart';

class PassField extends StatefulWidget {
  final String text;
  const PassField({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        obscureText: obsecureText,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
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
          border: const OutlineInputBorder(),
          labelText: widget.text,
        ),
      ),
    );
  }
}
