import 'package:crocodic_login/constant.dart';
import 'package:flutter/material.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(
            child: Divider(
              color: kSecondaryColor,
            ),
          ),
          Text('Or Login With'),
          Expanded(
            child: Divider(
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
