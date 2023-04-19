import 'dart:ui';

import 'package:crocodic_login/constant.dart';
import 'package:crocodic_login/views/authentication/loginpage/loginpage.dart';
import 'package:crocodic_login/views/authentication/registerpage/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: '',
            bodyWidget: containerGrow(
              title: 'Grow Exponentially',
              subtitle: description1,
            ),
            image: Center(
              child: Transform(
                transform: Matrix4.translationValues(0, 50, 0),
                child: SvgPicture.asset('assets/images/grow.svg'),
              ),
            ),
          ),
          PageViewModel(
            title: '',
            bodyWidget: containerGrow(
              title: 'Build High Quality Apps',
              subtitle: description2,
            ),
            image: Center(
              child: Transform(
                transform: Matrix4.translationValues(0, 50, 0),
                child: SvgPicture.asset('assets/images/coding.svg'),
              ),
            ),
          ),
          PageViewModel(
            title: '',
            bodyWidget: containerGrow(
              title: 'Fast Maintenance Support',
              subtitle: description3,
            ),
            image: Center(
              child: Transform(
                transform: Matrix4.translationValues(0, 50, 0),
                child: SvgPicture.asset('assets/images/suport.svg'),
              ),
            ),
          ),
          PageViewModel(
            title: '',
            bodyWidget: containerGrow(
              title: 'Welcome To Crocodic Academy',
              subtitle: description4,
            ),
            image: Center(
              child: Transform(
                transform: Matrix4.translationValues(0, 50, 0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    'assets/images/murid.svg',
                  ),
                ),
              ),
            ),
          ),
        ],
        showNextButton: false,
        showSkipButton: false,
        showBackButton: false,
        done: const Text("Get Started"),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyWidget(),
            ),
          );
        },
      ),
    );
  }
}

class containerGrow extends StatelessWidget {
  final String title, subtitle;
  const containerGrow({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              subtitle,
              style: GoogleFonts.patrickHand(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
