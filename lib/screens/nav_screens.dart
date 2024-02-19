import 'package:cyber_rakshak/screens/login_screen.dart';
import 'package:cyber_rakshak/widgets/page.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      onPageChanged: (val) async {
        if (val == 2) {
          await Future.delayed(const Duration(seconds: 3));
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false);
        }
      },
      children: const [
        PageViewPage(
          image: "one",
          title: "New Case",
          subtitle: "New Way to file the case",
        ),
        PageViewPage(
          image: "two",
          title: "Criminal Record",
          subtitle: "Check whether that person has a criminal record or not",
        ),
        PageViewPage(
          image: "three",
          title: "Investigation",
          subtitle: "Caught the Criminal before it would take next step",
        ),
      ],
    ));
  }
}
