import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class googleContainer extends StatelessWidget {
  const googleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: sizeHeight * 0.080,
      // color: Colors.red,
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
