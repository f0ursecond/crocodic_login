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
        title: welcomeText(context),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
@override
Widget welcomeText(BuildContext context) {
  return const Text(
    // ignore: prefer_interpolation_to_compose_strings
    'Welcome ',
  );
}
