import 'package:flutter/material.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // ElevatedButton(onPressed: () {}, child: Text("hello")),
          ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: CircleAvatar(
                maxRadius: 30,
                child: Image.network(
                    "https://pbs.twimg.com/profile_images/1710650957774667776/ZSaNJ9IX_400x400.jpg")),
          )
        ],
      ),
    );
  }
}
