import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/dashboard.dart';
import 'package:cyber_rakshak/widgets/buildTextField.dart';
import 'package:cyber_rakshak/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: const AssetImage(
                "assets/login.png",
              ),
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            buildTextField(
                hintText: "Username",
                textEditingController: usernameController),
            buildTextField(
                top: 5,
                hintText: "Password",
                textEditingController: passwordController),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
            CustomButton(
              str: "Sign In",
              onPressed: () {
                if (usernameController.text == "ADMIN" &&
                    passwordController.text == "admin") {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: ListTile(
                    tileColor: Colors.greenAccent,
                    leading: Icon(
                      Icons.lock_open,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Welcome Investigator !",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                          color: Colors.white),
                    ),
                  )));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const DashBoard()),
                      (route) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: ListTile(
                    tileColor: Colors.redAccent,
                    leading: Icon(
                      Icons.lock_open,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Wrong Authentication !",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                          color: Colors.white),
                    ),
                  )));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
