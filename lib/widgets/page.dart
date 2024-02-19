import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const PageViewPage(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(
                "assets/$image.png",
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 19.0,
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontFamily: "Poppins",
            ),
          )
        ],
      ),
    );
  }
}
