import 'package:crocodic_login/views/authentication/components/btnprimary.dart';
import 'package:crocodic_login/views/authentication/components/txtback.dart';
import 'package:flutter/material.dart';
import 'package:crocodic_login/db_user/app_database.dart';
import 'package:crocodic_login/db_user/user.dart';

import '../components/passfield.dart';
import '../components/txtfield.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final namaCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  List<User> listUser = [];

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  Future<void> getAllData() async {
    final database = await databaseLocal;
    final datas = await database.userDao.findAllUser();

    setState(() {
      listUser = datas;
    });
  }

  Future<User?> getData({required int id}) async {
    final database = await databaseLocal;
    final data = await database.userDao.findUserById(id);
    return data;
  }

  Future<void> saveData({
    required String nama,
    required String email,
    required String password,
  }) async {
    final database = await databaseLocal;
    await database.userDao.insertUser(User(
      nama: nama,
      email: email,
      password: password,
    ));
    getAllData();
  }

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
        child: SingleChildScrollView(
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
                      controller: namaCtrl,
                      text: 'Nama',
                      iconcuy: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TxtField(
                      controller: emailCtrl,
                      text: 'Email',
                      iconcuy: Icon(Icons.mail),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PassField(controller: passwordCtrl, text: 'Password'),
                    const SizedBox(
                      height: 10,
                    ),
                    PassField(
                      controller: passwordCtrl,
                      text: 'Masukan Kembali Password',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonPrimary(
                      text: 'Resister',
                      press: () {
                        saveData(
                          nama: namaCtrl.text,
                          email: emailCtrl.text,
                          password: passwordCtrl.text,
                        );
                        clear();
                        Navigator.pushNamed(
                          context,
                          '/LoginPage',
                        );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TxtBack(
                      text: 'Kembali Ke Login',
                      press: () {
                        Navigator.pushNamed(
                          context,
                          '/LoginPage',
                        );
                      },
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

  void clear() {
    namaCtrl.text = '';
    emailCtrl.text = '';
    passwordCtrl.text = '';
  }
}
