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
    final data1 = Biodata(
        nama: 'Budi',
        kota: 'Boyolali',
        tgllahir: '12/2/1992',
        description: 'INI BAPAK BUDIII',
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1683126899216-eb65393753c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60');
    final data2 = Biodata(
        nama: 'Topik',
        kota: 'Semarang',
        tgllahir: '21/2/1932',
        description: 'INI BAPAK TOPIK',
        imageUrl:
            'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60');
    final data3 = Biodata(
        nama: 'Bambang',
        kota: 'Bali',
        tgllahir: '21/10/1982',
        description: 'INI BAPAK BAMBANG',
        imageUrl:
            'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60');
    murid.addAll([data1, data2, data3]);
  }

  List<Biodata> muridFilters = [];
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: searchMurid,
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Search Murid',
                suffixIcon: IconButton(
                  onPressed: () => setState(() {}),
                  icon: const Icon(Icons.find_in_page),
                ),
              ),
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
                      onPressed: () => delete(idx: newIdx(item)),
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

  void searchMurid(String query) {
    final suggestion = murid.where((murid) {
      final muridName = murid.nama.toLowerCase();
      final input = query.toLowerCase();
      return muridName.contains(input);
    }).toList();

    setState(() {
      murid = suggestion;
    });
  }

  int newIdx(Biodata data) => murid.indexOf(data);

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
