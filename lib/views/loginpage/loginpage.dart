import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    passField(text: 'Masukan password'),
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
        child: const Text('Back To Login'),
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

class passField extends StatefulWidget {
  final String text;
  const passField({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<passField> createState() => _passFieldState();
}

class _passFieldState extends State<passField> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: _obsecureText,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: _obsecureText
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obsecureText = !_obsecureText;
              });
            },
          ),
          border: const OutlineInputBorder(),
          labelText: widget.text,
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
          border: const OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}
