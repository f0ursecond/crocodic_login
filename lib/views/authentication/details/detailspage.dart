import 'package:crocodic_login/userlist.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  static String routeName = '/DetailsPage';
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WelcomeText(context, userList),
      ),
    );
  }
}

@override
Widget WelcomeText(BuildContext context, index) {
  return Text(
    // ignore: prefer_interpolation_to_compose_strings
    'Welcome ',
  );
}
