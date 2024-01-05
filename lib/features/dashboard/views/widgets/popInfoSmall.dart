import 'package:flutter/material.dart';

enum PopColor { green, orange, red, blue }

class PopInfoSmall extends StatelessWidget {
  const PopInfoSmall(
      {super.key,
      required this.hight,
      this.text,
      this.child,
      required this.color,
      this.number});

  final double hight;
  final String? text;
  final int? number;
  final PopColor color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: hight,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: GetColor(color))),
        child: (child != null)
            ? child
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    number.toString(),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    text!,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  )
                ],
              ));
  }
}

List<Color> GetColor(PopColor color) {
  switch (color) {
    case PopColor.green:
      return [Color(0xffA9FFEA), Color(0xff00B288)];
    case PopColor.orange:
      return [Color(0xffFFD29D), Color(0xffFF9E2D)];
    case PopColor.red:
      return [Color(0xffFFA0BC), Color(0xffFF1B5E)];
    case PopColor.blue:
      return [Color(0xffB1EEFF), Color(0xff29BAE2)];
  }
}
