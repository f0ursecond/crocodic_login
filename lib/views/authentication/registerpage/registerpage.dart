import 'package:crocodic_login/views/authentication/components/btnprimary.dart';
import 'package:crocodic_login/views/authentication/components/txtback.dart';
import 'package:flutter/material.dart';

import '../components/passfield.dart';
import '../components/txtfield.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
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
                    const TxtField(
                      text: 'Nama',
                      iconcuy: Icon(Icons.person),
                    ),
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
                      text: 'Resister',
                      press: () {},
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TxtBack(
                      text: 'Kembali Ke Login',
                      press: () {},
                    ),
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
