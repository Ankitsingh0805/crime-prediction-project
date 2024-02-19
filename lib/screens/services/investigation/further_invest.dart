import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/services/investigation/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FurtherInvestigation extends StatelessWidget {
  final String data;
  FurtherInvestigation({super.key, required this.data});

  List<String> list = text.split(".");
  @override
  Widget build(BuildContext context) {
    list = list.sublist(0, 5);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.5,
                  image: AssetImage(
                    "assets/invest.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  leading: CircleAvatar(
                      radius: 30,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: const Image(
                              image: AssetImage("assets/ips.png")))),
                  title: const Text(
                    "Investigation officer ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: "Poppins"),
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "The most probable Step is...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Poppins",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Text(data,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 109, 64, 255),
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Precautions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold)),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (c, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3))
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${index + 1}. ${list[index]}",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: list.length,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
