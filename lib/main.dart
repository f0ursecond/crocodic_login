import 'package:crocodic_login/views/home/homepage.dart';
import 'package:crocodic_login/views/onboard/onboardscreen.dart';
import 'package:crocodic_login/views/scrollview/scrollview.dart';
import 'package:flutter/material.dart';

import 'views/authentication/registerpage/registerpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingScreen(),
        '/RegisterPage': (context) => const MyWidget(),
        '/HomePage': (context) => const HomePage(),
        '/ScrollPage': (context) => const ScrollViewPage(),
      },
    );
  }
}
