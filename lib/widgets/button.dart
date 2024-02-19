import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  VoidCallback? onPressed;
  String str;
  CustomButton({super.key, this.onPressed, this.str = "Get Started"});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          bottom: MediaQuery.of(context).size.height * 0.05,
        ),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 12,
              color: Colors.blue,
            )
          ],
          color: const Color.fromARGB(255, 0, 170, 255),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Center(
            child: Text(
          str,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
