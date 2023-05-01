import 'package:crocodic_login/views/authentication/components/btnprimary.dart';
import 'package:crocodic_login/views/authentication/components/social.dart';
import 'package:flutter/material.dart';

import '../components/loginsection.dart';
import '../components/passfield.dart';
import '../components/txtfield.dart';

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const TxtField(
                      text: 'Email',
                      iconcuy: Icon(Icons.mail),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const PassField(text: 'Password'),
                    const SizedBox(
                      height: 10,
                    ),
                    const PassField(
                      text: 'Masukan Kembali Password',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonPrimary(
                      text: 'Login',
                      press: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SocialWidget(),
                    const GoogleContainer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
