import 'package:crocodic_login/db_user/app_database.dart';
import 'package:crocodic_login/db_user/user.dart';
import 'package:crocodic_login/views/authentication/components/btnprimary.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../components/passfield.dart';
import '../components/txtfield.dart';

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

    final namaC = TextEditingController();
    final emailC = TextEditingController();
    final passC = TextEditingController();

    Future<void> readData() async {
      final database = await databaseLocal;
      final datas = await database.userDao.findAllUser();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.popAndPushNamed(context, '/ListMurid'),
            icon: const Icon(
              Icons.arrow_forward_sharp,
            ),
          )
        ],
      ),
      body: Form(
        child: SafeArea(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TxtField(
                      controller: namaC,
                      text: 'Nama',
                      iconcuy: const Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TxtField(
                      controller: emailC,
                      text: 'Email',
                      iconcuy: const Icon(Icons.mail),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PassField(controller: passC, text: 'Password'),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonPrimary(
                        text: 'Login',
                        press: () {
                          Navigator.pushReplacementNamed(
                              context, '/ClassListPage');
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
