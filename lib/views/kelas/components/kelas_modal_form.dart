import 'package:crocodic_login/model.dart';

import 'package:flutter/material.dart';

class ModalForm extends StatefulWidget {
  const ModalForm({
    super.key,
    this.data,
    required this.onDataReceived,
  });

  final Biodata? data;
  final Function(Biodata) onDataReceived;

  @override
  State<ModalForm> createState() => _ModalFormState();
}

class _ModalFormState extends State<ModalForm> {
  final namaController = TextEditingController();
  final descriptionController = TextEditingController();
  final kotaController = TextEditingController();
  final tgllahirController = TextEditingController();
  final imageUrlController = TextEditingController();

  Biodata? biodata;

  @override
  void initState() {
    biodata = widget.data;
    imageUrlController.text = biodata?.imageUrl ?? '';
    namaController.text = biodata?.nama ?? '';
    kotaController.text = biodata?.kota ?? '';
    tgllahirController.text = biodata?.tgllahir ?? '';
    descriptionController.text = biodata?.description ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 500,
        minWidth: double.infinity,
      ),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: imageUrlController,
                  decoration: const InputDecoration(
                    labelText: 'Gambar',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  minLines: 1,
                )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFieldBang(
                controller: namaController,
                label: 'Nama',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFieldBang(
                controller: kotaController,
                label: 'Kota',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFieldBang(
                controller: tgllahirController,
                label: 'Tanggal Lahir | DD/MM/YYYY',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                minLines: 1,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 9,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () => editItem(context),
                  child: const Text('Konfirmasi'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  editItem(BuildContext context) {
    setState(() {
      if (imageUrlController.text.isEmpty) {
        showAlert(context: context, message: 'Gambar tidak boleh kosong');
        return;
      }
      if (namaController.text.isEmpty) {
        showAlert(context: context, message: 'Nama tidak boleh kosong');
        return;
      }

      if (kotaController.text.isEmpty) {
        showAlert(context: context, message: 'Kota tidak boleh kosong');
        return;
      }

      if (tgllahirController.text.isEmpty) {
        showAlert(context: context, message: 'Tanggal tidak boleh kosong');
        return;
      }
      if (descriptionController.text.isEmpty) {
        showAlert(context: context, message: 'Deskripsi tidak boleh kosong');
        return;
      }

      if (!isURLValid(imageUrlController.text)) {
        showAlert(context: context, message: 'URL Gambar tidak valid');
        return;
      }

      if (biodata == null) {
        biodata = Biodata(
          imageUrl: imageUrlController.text,
          nama: namaController.text,
          kota: kotaController.text,
          tgllahir: tgllahirController.text,
          description: descriptionController.text,
        );
      } else {
        biodata?.setData(
          imageUrl: imageUrlController.text,
          nama: namaController.text,
          kota: kotaController.text,
          tgllahir: tgllahirController.text,
          description: descriptionController.text,
        );
      }
      widget.onDataReceived(biodata!);
      Navigator.of(context).pop();
    });
  }
}

class TextFieldBang extends StatelessWidget {
  const TextFieldBang({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}

bool isURLValid(String urlString) {
  final regex = RegExp(
    r'^(http(s)?:\/\/)?(www\.)?[a-zA-Z0-9-_\.]+(\.[a-zA-Z]{2,})(:\d{1,5})?(\/\S*)?$',
    caseSensitive: false,
    multiLine: false,
  );

  return regex.hasMatch(urlString);
}

void showAlert({
  required BuildContext context,
  required String message,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Dismiss'),
          ),
        ],
      );
    },
  );
}
