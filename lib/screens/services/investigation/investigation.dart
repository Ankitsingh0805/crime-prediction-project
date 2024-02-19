import 'dart:convert';
import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/services/investigation/further_invest.dart';
import 'package:cyber_rakshak/screens/services/investigation/predictions.dart';
import 'package:cyber_rakshak/widgets/buildTextField.dart';
import 'package:cyber_rakshak/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class Investigation extends StatefulWidget {
  const Investigation({super.key});
  @override
  State<Investigation> createState() => _InvestigationState();
}

class _InvestigationState extends State<Investigation> {
  final TextEditingController _caseController = TextEditingController();
  final TextEditingController _ticketController = TextEditingController();
  List<String> steps = [];
  String str = "";

  //change the urls on deployment
  //for android emulator ip is 10.0.2.2
  //for real device ip is the ip of the server

  //for multiple outputs
  String serverUrl = "http://10.0.2.2:5000/predict";
  //for single outputs
  String url = "http://10.0.2.2:8080/predict";
  Future<List<String>> generateNextWords(
      String crimeType, List<String> crimeProcessSteps) async {
    Map<String, dynamic> requestBody = {
      'crime_type': crimeType,
      'crime_process_steps': crimeProcessSteps,
    };
    String requestBodyJson = json.encode(requestBody);
    http.post(Uri.parse(serverUrl),
        body: requestBodyJson,
        headers: {'Content-Type': 'application/json'}).then((res) async {
      if (res.statusCode == 200) {
        final out = await json.decode(res.body);
        final lst = out["next_steps"].toString();
        final finalLst = lst.split(",").toList();
        setState(() {
          steps = finalLst;
        });
        return finalLst;
      } else {
        return [""];
      }
    });
    return [" "];
  }

  Future<String> generateString(
      String crimeType, String crimeProcessSteps) async {
    Map<String, dynamic> requestBody = {
      'crime_type': crimeType,
      'steps': crimeProcessSteps,
    };
    String requestBodyJson = await json.encode(requestBody);
    http.post(Uri.parse(url),
        body: requestBodyJson,
        headers: {'Content-Type': 'application/json'}).then((res) async {
      if (res.statusCode == 200) {
        final out = await json.decode(res.body);
        final lst = out['out'].toString();

        setState(() {
          str = lst;
        });
        return lst;
      } else {
        return "";
      }
    });
    return "";
  }

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
                  image: AssetImage("assets/invest.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: const Center(
                  child: Text(
                "Investigation",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 28),
              )),
            ),
            buildContainer("Attack Type *", 40, _caseController),
            // Row(chi)

            buildContainer("Steps", 40, _ticketController),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              str: "Let's Investigate",
              onPressed: () async {
                generateNextWords(_caseController.text,
                        _ticketController.text.split(",").toList())
                    .then((value) => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => Predictions(lst: steps))));
              },
            ),
            CustomButton(
              str: "Single Ouput",
              onPressed: () async {
                generateString(_caseController.text, _ticketController.text)
                    .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FurtherInvestigation(data: str))));
              },
            )
          ],
        ),
      ),
    );
  }

  buildContainer(String hintText, double h, TextEditingController? controller) {
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
              hintText: "",
              textEditingController: controller,
              top: 5,
              left: 0,
              right: 0,
              bottom: 0,
              h: h),
        ],
      ),
    );
  }
}
