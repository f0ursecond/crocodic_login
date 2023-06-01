import 'package:crocodic_login/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  final namaController = TextEditingController();
  final descriptionController = TextEditingController();
  final kotaController = TextEditingController();
  final tgllahirController = TextEditingController();
  final imageUrlController = TextEditingController();

  Biodata? biodata;

  @override
  void initState() {
    biodata = Biodata(
      nama: 'Alif Zulfanur',
      description:
          'Pariatur cupidatat enim officia commodo amet pariatur quis mollit excepteur. Adipisicing occaecat cillum do sit dolore ad occaecat eu. Labore adipisicing deserunt elit nulla mollit qui est minim eu id nisi nostrud et. Anim laborum nulla eiusmod labore sint duis eu sint id occaecat qui sint adipisicing nulla.',
      kota: 'Semarang',
      tgllahir: '30/10/2004',
      imageUrl:
          'https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    );

    imageUrlController.text = biodata?.imageUrl ?? '';
    namaController.text = biodata?.nama ?? '';
    kotaController.text = biodata?.kota ?? '';
    tgllahirController.text = biodata?.tgllahir ?? '';
    descriptionController.text = biodata?.description ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                child: Image(
                  image: NetworkImage(biodata?.imageUrl ?? ''),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      biodata?.nama ?? '',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          biodata?.kota ?? '',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          ', ${biodata?.tgllahir}',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Text(
                      biodata?.description ?? '',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
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
                                          padding: EdgeInsets.all(8.0),
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
                            });
                      },
                      child: Text(
                        'Ubah Data',
                        style: GoogleFonts.asap(
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
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

      setState(() {
        biodata?.setData(
          imageUrl: imageUrlController.text,
          nama: namaController.text,
          kota: kotaController.text,
          tgllahir: tgllahirController.text,
          description: descriptionController.text,
        );
      });

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

void showAlert({required BuildContext context, required String message}) {
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
