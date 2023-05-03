import 'package:crocodic_login/constant.dart';
import 'package:crocodic_login/model.dart';
import 'package:flutter/material.dart';

import 'textcontent.dart';

class ContainerData extends StatelessWidget {
  const ContainerData({
    super.key,
    required this.sizeWidth,
    required this.sizeHeight,
    required this.person,
  });

  final double sizeWidth;
  final double sizeHeight;
  final PersonElement person;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: sizeWidth * 0.9,
      height: sizeHeight * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextContent(person: person),
          ],
        ),
      ),
    );
  }
}
