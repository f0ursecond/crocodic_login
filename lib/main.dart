import 'package:crocodic_login/controller/darkmode_controller.dart';
import 'package:crocodic_login/views/aboutme/aboutme.dart';
import 'package:crocodic_login/views/calculator/calculator_view.dart';
import 'package:crocodic_login/views/home/homepage.dart';
import 'package:crocodic_login/views/onboard/onboardscreen.dart';
import 'package:crocodic_login/views/scrollview/scrollview.dart';
import 'package:crocodic_login/views/shop/shopinglist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/authentication/registerpage/registerpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final cTheme = Get.put(ChangeTheme());
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: cTheme.isDark.value ? ThemeData.dark() : ThemeData.light(),
        initialRoute: '/AboutMePage',
        routes: {
          '/': (context) => const OnBoardingScreen(),
          '/RegisterPage': (context) => const MyWidget(),
          '/HomePage': (context) => const HomePage(),
          '/ScrollPage': (context) => const ScrollViewPage(),
          '/CalculatorPage': (context) => const CalculatorView(),
          '/ShopingListPage': (context) => const ShoppingListScreen(),
          '/AboutMePage': (context) => const AboutMePage(),
        },
      ),
    );
  }
}
