import 'package:crocodic_login/db_user/app_database.dart';
import 'package:crocodic_login/db_user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ListMurid extends StatefulWidget {
  const ListMurid({super.key});

  @override
  State<ListMurid> createState() => _ListMuridState();
}

class _ListMuridState extends State<ListMurid> {
  final namaCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  List<User> listUser = [];

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  Future<void> getAllData() async {
    final database = await databaseLocal;
    final datas = await database.userDao.findAllUser();
    setState(() {
      listUser = datas;
    });
  }

  Future<User?> getData({required int id}) async {
    final database = await databaseLocal;
    final data = await database.userDao.findUserById(id);
    return data;
  }

  Future<void> deleteAllData({required int id}) async {
    final database = await databaseLocal;
    await database.userDao.deleteAllUser(id);
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tampil Database'),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: listUser.length,
            itemBuilder: (context, index) {
              final data = listUser[index];
              return Card(
                child: ListTile(
                  leading: Text(data.id.toString()),
                  title: Text(data.nama),
                  subtitle: Text(data.email),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        deleteAllData(id: data.id?.toInt() ?? 0);
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }),
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(
      //       Icons.add,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       showDialog(
      //         context: context,
      //         builder: (context) {
      //           return AlertDialog(
      //             title: const Text('Input Data'),
      //             content: Column(
      //               children: [
      //                 TextField(
      //                   controller: namaCtrl,
      //                   decoration: const InputDecoration(hintText: 'Nama'),
      //                 ),
      //                 TextField(
      //                   controller: emailCtrl,
      //                   decoration: const InputDecoration(hintText: 'Email'),
      //                 ),
      //                 TextField(
      //                   controller: passwordCtrl,
      //                   decoration: const InputDecoration(hintText: 'Password'),
      //                 ),
      //               ],
      //             ),
      //             actions: [
      //               TextButton(
      //                   onPressed: () {
      //                     saveData(
      //                       nama: namaCtrl.text,
      //                       email: emailCtrl.text,
      //                       password: passwordCtrl.text,
      //                     );
      //                     clear();
      //                     Navigator.pop(context);
      //                   },
      //                   child: const Text('OK'))
      //             ],
      //           );
      //         },
      //       );
      //     }),
    );
  }

  void clear() {
    namaCtrl.text = '';
    emailCtrl.text = '';
    passwordCtrl.text = '';
  }
}
