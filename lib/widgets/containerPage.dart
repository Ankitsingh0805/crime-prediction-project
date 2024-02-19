import 'package:cyber_rakshak/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  final String img;
  final String str;
  final VoidCallback? onTap;
  ContainerPage({super.key, required this.img, required this.str, this.onTap});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          show = !show;
        });
        // print(show);
      },
      onDoubleTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/${widget.img}.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: show == true
                  ? Center(
                      child: Text(
                        widget.str,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : null),
          show == true
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.deepPurple.shade900.withOpacity(0.3),
                    Colors.deepPurple.shade700.withOpacity(0.3),
                    Colors.deepPurple.shade500.withOpacity(0.3),
                    Colors.deepPurple.shade300.withOpacity(0.3),
                  ],
                )))
              : Container()
        ]),
      ),
    );
  }
}
