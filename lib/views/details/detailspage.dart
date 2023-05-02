import 'package:crocodic_login/constant.dart';
import 'package:crocodic_login/model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  static String routeName = '/DetailsPage';
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
                Container(
                  decoration: const BoxDecoration(
                    color: kSecondaryColor,
                  ),
                  width: sizeWidth * 1,
                  height: sizeHeight / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'PROFILE SETTINGS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(0, -50, 0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(person.imageUrl),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: sizeWidth * 0.9,
                  height: sizeHeight * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${person.firstName} ${person.lastName}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Gender : ${person.gender}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Age: ${person.age}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Phone Number : ${person.number}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
