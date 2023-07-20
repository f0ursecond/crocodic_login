import 'dart:io';

import 'package:crocodic_login/model.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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
  final hobiController = TextEditingController();

  Biodata? biodata;
  String _imagePath = '';

  @override
  void initState() {
    biodata = widget.data;

    namaController.text = biodata?.nama ?? '';
    kotaController.text = biodata?.kota ?? '';
    tgllahirController.text = biodata?.tgllahir ?? '';
    _imagePath = biodata?.image ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldBang(
                controller: namaController,
                label: 'Nama',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldBang(
                controller: kotaController,
                label: 'Kota',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldBang(
                controller: tgllahirController,
                label: 'Tanggal Lahir | DD/MM/YYYY',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: hobiController,
                decoration: const InputDecoration(
                  labelText: 'Hobii',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                minLines: 1,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Visibility(
                    visible: _imagePath.isNotEmpty,
                    child: Image.file(
                      File(_imagePath),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: const Text('Ambil dari Kamera'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      child: const Text('Ambil dari Galeri'),
                    )
                  ],
                )
              ],
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

  Future _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imagePath = pickedFile.path;
        });
      }
    } on PlatformException catch (e) {
      debugPrint("Failed to pick image: $e");
    }
  }

  editItem(BuildContext context) {
    setState(() {
      if (_imagePath.isEmpty) {
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

      if (biodata == null) {
        biodata = Biodata(
          image: _imagePath,
          nama: namaController.text,
          kota: kotaController.text,
          tgllahir: tgllahirController.text,
          description: descriptionController.text,
        );
      } else {
        biodata?.setData(
          image: _imagePath,
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
