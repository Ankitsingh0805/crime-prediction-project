// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
// import 'package:http/http.dart' as http;
import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/services/investigation/constants.dart';
import 'package:cyber_rakshak/widgets/buildTextField.dart';
import 'package:cyber_rakshak/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewCasePage extends StatefulWidget {
  const NewCasePage({super.key});

  @override
  State<NewCasePage> createState() => _NewCasePageState();
}

class _NewCasePageState extends State<NewCasePage> {
  String serverUrl = 'http://10.0.2.2:8000/generate-pdf';
  final TextEditingController expectedAttack = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController describe = TextEditingController();
  final TextEditingController attach = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController investigator = TextEditingController();

  // Future<void> createPdf() async {
  //   final Map<String, dynamic> data = <String, dynamic>{
  //     'case_number': Random().nextInt(100000).toString(),
  //     'expected_attack': expectedAttack.text,
  //     'location_and_time': location.text,
  //     'describe_incident': describe.text,
  //     'attach_file_link': attach.text,
  //     'date_and_location_of_incident': date.text,
  //     'investigator': investigator.text,
  //   };
  //   final response = await http.post(
  //     Uri.parse(serverUrl),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(data),
  //   );
  //   if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     final pdfContent = responseData['pdf_content'] as String;

  //     // Handle the received PDF content, e.g., save it to a file or display it
  //     print("Received PDF content: $pdfContent");
  //     final pdfBytes = base64Decode(pdfContent);
  //     final directory = await getApplicationDocumentsDirectory();
  //     final filePath = "${directory.path}/incident_report.pdf";
  //     final file = File(filePath);
  //     await file.writeAsBytes(pdfBytes);
  //     // File('example.pdf').writeAsBytesSync(base64Decode(pdfContent));
  //   } else {
  //     print("Failed to generate PDF: ${response.statusCode}");
  //     // Handle error cases
  //   }
  final list = [];
  @override
  void initState() {
    // TODO: implement initState
    print(lst);
    super.initState();
  }
  // }

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
            buildContainer(
              "Expected Attack",
              40,
              expectedAttack,
            ),
            buildContainer("Location and Time (IST) of FIR", 40, location),
            buildContainer("Describe the incident", 70, describe),
            buildContainer("Attach files", 40, attach),
            buildContainer("Date and Location of incident", 40, date),
            buildContainer("Investigator", 40, investigator),
            CustomButton(
              str: "Submit",
              onPressed: () async {
                // await createPdf();
              },
            )
          ],
        ),
      ),
    );
  }

  buildContainer(String hintText, double h, TextEditingController? controller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
