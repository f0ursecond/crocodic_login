import 'package:crocodic_login/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../components/loginsection.dart';
import '../../components/passfield.dart';
import '../../components/txtfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: sizeHeight * 0.02),
              child: Image.asset(
                'assets/images/crocodic.png',
                width: sizeWidth / 2,
              ),
            ),
            SingleChildScrollView(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      txtField(
                        text: 'Email',
                        iconcuy: Icon(Icons.mail),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      passField(text: 'Password'),
                      SizedBox(
                        height: 10,
                      ),
                      passField(
                        text: 'Masukan Kembali Password',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      btn(),
                      SizedBox(
                        height: 30,
                      ),
                      dividerWidget(),
                      googleContainer(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class dividerWidget extends StatelessWidget {
  const dividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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

class txtBack extends StatelessWidget {
  const txtBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {},
        child: Text('Back To Login'),
      ),
    );
  }
}

class btn extends StatelessWidget {
  const btn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Login'),
      ),
    );
  }
}
