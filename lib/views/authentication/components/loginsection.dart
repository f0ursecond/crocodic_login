import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class GoogleContainer extends StatelessWidget {
  const GoogleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: sizeHeight * 0.080,
      child: Center(
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                MaterialCommunityIcons.google,
              ),
              Icon(
                MaterialCommunityIcons.facebook,
              ),
              Icon(
                MaterialCommunityIcons.github,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
