import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/nav_screens.dart';
import 'package:cyber_rakshak/widgets/button.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/open.png",
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          const ListTile(
            dense: true,
            // visualDensity: VisualDensity(vertical: -5.0),
            title: Text(
              "CyberRakshak",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("Your Investigation Companion",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  height: 0.3,
                  fontSize: 14,
                  fontFamily: "Poppins",
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          CustomButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const NavScreen()),
                  (route) => false);
            },
          )
        ],
      ),
    );
  }
}
