import 'dart:io';

import 'package:crocodic_login/model.dart';
import 'package:crocodic_login/views/kelas/components/kelas_modal_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({
    super.key,
    required this.data,
    required this.onDataReceived,
  });

  final Biodata data;
  final Function(Biodata) onDataReceived;

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  Biodata? data;

  @override
  void initState() {
    data = widget.data;
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
                child: Image.file(
                  File(data?.image ?? ''),
                  height: 400,
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
                      data?.nama ?? '',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          data?.kota ?? '',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          ', ${data?.tgllahir}',
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
                      data?.description ?? '',
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
                              return ModalForm(
                                data: data,
                                onDataReceived: (data) {
                                  setState(() {
                                    this.data = data;
                                    widget.onDataReceived(data);
                                  });
                                },
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
}
