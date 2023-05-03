import 'package:crocodic_login/model.dart';
import 'package:crocodic_login/views/details/components/containerdata.dart';
import 'package:crocodic_login/views/details/components/header.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final PersonElement person;
  const DetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderContainer(
                  sizeWidth: sizeWidth,
                  sizeHeight: sizeHeight,
                ),
                Transform(
                  transform: Matrix4.translationValues(0, -50, 0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(person.imageUrl),
                  ),
                ),
                ContainerData(
                  sizeWidth: sizeWidth,
                  sizeHeight: sizeHeight,
                  person: person,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
