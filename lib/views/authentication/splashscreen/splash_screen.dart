import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> checkState() async {
    const storage = FlutterSecureStorage();
    String id = await storage.read(key: 'id') ?? '';
    Future.delayed(const Duration(seconds: 3), () {
      if (id.isNotEmpty) {
        Navigator.popAndPushNamed(context, '/ClassListPage');
      } else {
        Navigator.popAndPushNamed(context, '/LoginPage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/crocodic.png'),
        ),
      ),
    );
  }
}
