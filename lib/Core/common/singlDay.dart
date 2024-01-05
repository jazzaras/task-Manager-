import 'package:flutter/material.dart';

class SingleDay extends StatelessWidget {
  const SingleDay(
      {super.key,
      required this.isSelected,
      required this.dayNum,
      required this.dayName});
  final bool isSelected;
  final String dayNum;
  final String dayName;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Color(0xff8B78FF), Color(0xff5451D6)];

    if (!isSelected) {
      colors = [Colors.white, Colors.white];
    }

    return AnimatedContainer(
      height: 127 * 1.1,
      width: 75 * 1.1,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      duration: Duration(milliseconds: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayNum,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            dayName,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
