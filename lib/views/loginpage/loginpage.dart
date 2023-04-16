import 'package:crocodic_login/constant.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    txtField(
                      text: 'Nama',
                      iconcuy: Icon(
                        Icons.person,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    txtField(
                      text: 'Email',
                      iconcuy: Icon(
                        Icons.email,
                      ),
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
        child: const Text('Register'),
      ),
    );
  }
}

class passField extends StatelessWidget {
  final String text;
  const passField({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.lock),
          border: OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}

class txtField extends StatelessWidget {
  final String text;
  final Icon iconcuy;
  const txtField({
    Key? key,
    required this.text,
    required this.iconcuy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: iconcuy,
          border: OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}
