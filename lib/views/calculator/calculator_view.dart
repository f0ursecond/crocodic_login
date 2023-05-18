import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  num? total;
  num? angka1;
  num? angka2;

  void sum() {
    setState(() {
      if (number1.text.isNotEmpty) {
        angka1 = int.parse(number1.text);
      }
      if (number2.text.isNotEmpty) {
        angka2 = int.parse(number2.text);
      }

      if (angka1 != null && angka2 != null) {
        setState(() {
          total = (angka1! + angka2!) as int?;
        });
      } else {
        setState(() {
          total = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tolong diisi semua'),
          ),
        );
      }
    });
    print(total);
  }

  void subtraction() {
    setState(() {
      if (number1.text.isNotEmpty) {
        angka1 = int.parse(number1.text);
      }
      if (number2.text.isNotEmpty) {
        angka2 = int.parse(number2.text);
      }

      if (angka1 != null && angka2 != null) {
        setState(() {
          total = (angka1! - angka2!) as int?;
        });
      } else {
        setState(() {
          total = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tolong diisi semua'),
          ),
        );
      }
    });
    print(total);
  }

  void multiplied() {
    setState(() {
      if (number1.text.isNotEmpty) {
        angka1 = int.parse(number1.text);
      }
      if (number2.text.isNotEmpty) {
        angka2 = int.parse(number2.text);
      }

      if (angka1 != null && angka2 != null) {
        setState(() {
          total = (angka1! * angka2!) as int?;
        });
      } else {
        setState(() {
          total = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tolong diisi semua'),
          ),
        );
      }
    });
    print(total);
  }

  void divided() {
    setState(() {
      if (number1.text.isNotEmpty) {
        angka1 = double.parse(number1.text);
      }
      if (number2.text.isNotEmpty) {
        angka2 = double.parse(number2.text);
      }

      if (angka1 != null && angka2 != null) {
        setState(() {
          total = angka1! / angka2!;
        });
      } else {
        setState(() {
          total = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tolong diisi semua'),
          ),
        );
      }
    });
    print(total);
  }

  final number1 = TextEditingController();
  final number2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: number1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    hintText: 'First Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: number2,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    hintText: 'Second Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        sum();
                      },
                      child: const Text('+'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        subtraction();
                      },
                      child: const Text('-'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        multiplied();
                      },
                      child: const Text('x'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        divided();
                      },
                      child: const Text('/'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: total != null,
                  child: Text('Total = $total'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
