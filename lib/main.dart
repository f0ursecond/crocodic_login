import 'package:crocodic_login/controller/darkmode_controller.dart';
import 'package:crocodic_login/views/authentication/loginpage/loginpage.dart';
import 'package:crocodic_login/views/authentication/splashscreen/splash_screen.dart';
import 'package:crocodic_login/views/calculator/calculator_view.dart';
import 'package:crocodic_login/views/home/homepage.dart';
import 'package:crocodic_login/views/lifecycle/lifecycle.dart';
import 'package:crocodic_login/views/viewdatabase/list_murid.dart';
import 'package:crocodic_login/views/onboard/onboardscreen.dart';
import 'package:crocodic_login/views/scrollview/scrollview.dart';
import 'package:crocodic_login/views/kelas/classlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/authentication/registerpage/registerpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final cTheme = Get.put(ChangeTheme());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: cTheme.isDark.value ? ThemeData.dark() : ThemeData.light(),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreenPage(),
          '/active': (context) => const ScreenActive(),
          '/onboard': (context) => const OnBoardingScreen(),
          '/RegisterPage': (context) => const MyWidget(),
          '/LoginPage': (context) => const LoginPage(),
          '/HomePage': (context) => const HomePage(),
          '/ScrollPage': (context) => const ScrollViewPage(),
          '/CalculatorPage': (context) => const CalculatorView(),
          '/ClassListPage': (context) => const ClassListScreen(),
          '/ListMurid': (context) => const ListMurid(),
        },
      ),
    );
  }
}
