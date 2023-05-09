import 'package:crocodic_login/model.dart';
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
      body: SingleChildScrollView(
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
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: '${person.firstName} ${person.lastName}',
                        prefixIcon: const Icon(Icons.perm_identity_rounded),
                      ),
                    ),
                    Divider(
                      color: ThemeData().dividerTheme.color,
                      thickness: 2,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: person.gender,
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    Divider(
                      color: ThemeData().dividerTheme.color,
                      thickness: 2,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: person.number,
                        prefixIcon: const Icon(Icons.call),
                      ),
                    ),
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
