import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/services/investigation/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Precautions extends StatelessWidget {
  Precautions({super.key});

  final precautions = text.split("\n");

  @override
  Widget build(BuildContext context) {
    print(precautions);
    precautions.shuffle();
    final myList = precautions.sublist(0, 5);
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
              "Precautions",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 217, 217, 217),
                  image: DecorationImage(
                    opacity: 0.2,
                    image: AssetImage("assets/open.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
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
                            myList[index],
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: myList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
