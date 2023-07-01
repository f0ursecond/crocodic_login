import 'package:flutter/material.dart';

class ScreenActive extends StatefulWidget {
  const ScreenActive({super.key});

  @override
  State<ScreenActive> createState() => _ScreenActiveState();
}

class _ScreenActiveState extends State<ScreenActive>
    with WidgetsBindingObserver {
  int counter = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   WidgetsBinding.instance.removeObserver(this);
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   setState(() {
  //     counter++;
  //   });
  //   super.didChangeAppLifecycleState(state);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          'LAYAR INI SUDAH MATI\n ${counter--}  X',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
