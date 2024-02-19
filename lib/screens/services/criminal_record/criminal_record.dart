import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/services/criminal_record/criminal.dart';
import 'package:cyber_rakshak/widgets/buildTextField.dart';
import 'package:cyber_rakshak/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CriminalRecord extends StatelessWidget {
  const CriminalRecord({super.key});

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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.4,
                  image: AssetImage("assets/record.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: const Center(
                  child: Text(
                "Criminal Record",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
            ),
            buildContainer("Criminal Name / Organization Name *", 40),
            buildContainer("Aadhaar Card *", 40),
            buildContainer("Location ( * for Organization )", 40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: CustomButton(
                str: "Find it",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CriminalFile()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  buildContainer(String hintText, double h) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          buildTextField(
              hintText: "", top: 5, left: 0, right: 0, bottom: 0, h: h),
        ],
      ),
    );
  }
}
