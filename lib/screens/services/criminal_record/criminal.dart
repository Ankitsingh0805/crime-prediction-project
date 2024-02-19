import 'package:cyber_rakshak/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CriminalFile extends StatelessWidget {
  const CriminalFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: const Image(image: AssetImage("assets/ips.png")))),
              title: const Text(
                "Investigation officer ",
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: "Poppins"),
              ),
              subtitle: const Text(
                'IPS Shruti',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 28),
              ),
              trailing: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset("assets/back.svg"),
              ),
            ),
            const Text(
              "Criminal Record",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/criminal.png",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  buildContainer(title: "Full Name", desc: "Alok Kumar Mishra"),
                  buildContainer(
                      title: "Father\’s Name", desc: "Ram Kumar Mishra"),
                  buildContainer(title: "Date of Birth", desc: "09/12/1980"),
                  buildContainer(
                      title: "Permanent Address", desc: "Muradnagar"),
                  buildContainer(
                      title: "Birth Mark", desc: "Cut mark in Right Hand"),
                  buildContainer(
                      title: "Previous Record",
                      desc: "1 record is found [11/12/2022]")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildContainer({
    required String title,
    required String desc,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black))),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
        subtitle: Text(
          desc,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 170, 255),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
