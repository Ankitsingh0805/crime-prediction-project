import 'package:flutter/material.dart';

Widget buildTextField(
    {double top = 10,
    double h = 50,
    TextEditingController? textEditingController,
    double left = 20,
    double right = 20,
    double bottom = 20,
    required String hintText}) {
  return Container(
    height: h,
    margin: EdgeInsets.only(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
    ),
    child: TextField(
      controller: textEditingController,
      // cursorHeight: 20,
      obscureText: hintText == "Password" ? true : false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w100,
        ),
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off,
                  color: Colors.black45,
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
          ),
        ),
      ),
    ),
  );
}
