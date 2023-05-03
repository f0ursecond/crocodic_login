import 'package:crocodic_login/model.dart';
import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  const TextContent({
    super.key,
    required this.person,
  });

  final PersonElement person;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name : ${person.firstName} ${person.lastName}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Gender : ${person.gender}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Age: ${person.age}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Phone Number : ${person.number}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
