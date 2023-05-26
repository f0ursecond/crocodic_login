import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  num? total;
  num? angka1;
  num? angka2;

  void reset() {
    number1.text = '';
    number2.text = '';
  }

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
          history.add('${number1.text} + ${number2.text} = $total');
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
          history.add('${number1.text} - ${number2.text} = $total');
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
          history.add('${number1.text} x ${number2.text} = $total');
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
          history.add('${number1.text} / ${number2.text} = $total');
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

  final List<String> history = [];
  final number1 = TextEditingController();
  final number2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: [
          IconButton(
            onPressed: () => reset(),
            icon: const Icon(Icons.restart_alt),
          ),
        ],
      ),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'History Kalkulator',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: history.isEmpty
                      ? const CenterText()
                      : ListHistory(
                          history: history,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CenterText extends StatelessWidget {
  const CenterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'History Masih Kosong',
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ListHistory extends StatefulWidget {
  const ListHistory({
    super.key,
    required this.history,
  });

  final List<String> history;

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

class _ListHistoryState extends State<ListHistory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: widget.history.length,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 500),
          child: SlideAnimation(
            child: FadeInAnimation(
              child: Card(
                color: Colors.green,
                child: ListTile(
                  title: Text(widget.history[index]),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.history.removeAt(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data berhasil Dihapus'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
