import 'package:crocodic_login/model.dart';
import 'package:crocodic_login/views/aboutme/aboutme.dart';
import 'package:crocodic_login/views/kelas/components/kelas_modal_form.dart';
import 'package:flutter/material.dart';

class ClassListScreen extends StatefulWidget {
  const ClassListScreen({super.key});

  @override
  State<ClassListScreen> createState() => _ClassListScreenState();
}

class _ClassListScreenState extends State<ClassListScreen> {
  final controller = TextEditingController();
  List<Biodata> murid = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('List Murid Murid'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Expanded(
                  child: Text('List Murid Murid'),
                ),
                IconButton(
                  onPressed: () => delete(),
                  icon: const Icon(Icons.clear_all_outlined),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: murid.length,
              itemBuilder: (context, index) {
                final item = murid[index];
                return Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image(
                        image: NetworkImage(
                      item.imageUrl,
                    )),
                    title: Text(item.nama),
                    subtitle: Text(item.description),
                    trailing: IconButton(
                      onPressed: () => delete(idx: index),
                      icon: const Icon(Icons.delete_outline),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutMePage(
                              data: item,
                              onDataReceived: (data) {
                                setState(() {
                                  murid[index] = data;
                                });
                              }),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return ModalForm(onDataReceived: (data) {
                  setState(() {
                    murid.add(data);
                  });
                });
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void delete({int? idx}) {
    if (idx != null) {
      setState(() {
        murid.removeAt(idx);
      });
    } else {
      setState(() {
        murid.clear();
      });
    }
  }

  void showAlert({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
