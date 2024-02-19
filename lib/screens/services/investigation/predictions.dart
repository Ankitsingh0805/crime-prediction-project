import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/services/investigation/constants.dart';
import 'package:cyber_rakshak/screens/services/investigation/precautions.dart';
import 'package:cyber_rakshak/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Predictions extends StatefulWidget {
  final List<String> lst;
  const Predictions({super.key, required this.lst});

  @override
  State<Predictions> createState() => _PredictionsState();
}

class _PredictionsState extends State<Predictions> {
  int i = 0;
  @override
  void initState() {
    setState(() {
      i++;
    });
    super.initState();
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
            GestureDetector(
              onTap: () => setState(() {
                i++;
              }),
              child: ListTile(
                leading: CircleAvatar(
                    radius: 30,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child:
                            const Image(image: AssetImage("assets/ips.png")))),
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
            ),
            const Text(
              "Prediction",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: const BoxDecoration(
                    color: Colors.white,
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
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 3))
                          ]),
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.only(top: 10),
                      child: ListTile(
                        title: Text(widget.lst[index],
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                  itemCount: widget.lst.length,
                )),
            //
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        str: "Precautions",
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Precautions()));
        },
      ),
    );
  }
}
