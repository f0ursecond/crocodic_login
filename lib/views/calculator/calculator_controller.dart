import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final number1 = TextEditingController();
  final number2 = TextEditingController();
  int total = 0;

  void sum() {
    var angka1 = int.parse(number1.text);
    var angka2 = int.parse(number2.text);

    total = int.parse(number1.text) + int.parse(number2.text);
    print(total);
  }

  void multiply() {}
}
