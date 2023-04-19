import 'package:crocodic_login/views/authentication/loginpage/loginpage.dart';
import 'package:flutter/material.dart';

import '../../components/passfield.dart';
import '../../components/txtfield.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
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
                      txtField(
                        text: 'Nama',
                        iconcuy: Icon(Icons.person),
                      ),
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
                        height: 5,
                      ),
                      txtBack()
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

class txtBack extends StatelessWidget {
  const txtBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
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
        child: const Text('Register'),
      ),
    );
  }
}
