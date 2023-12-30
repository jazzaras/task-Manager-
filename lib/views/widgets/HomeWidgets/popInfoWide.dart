import 'package:flutter/material.dart';

class PopInfoWide extends StatelessWidget {
  const PopInfoWide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff8B78FF), Color(0xff5451D6)])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Information Architecture",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
          ),
          const Text(
            "saber & Oro",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: CircleAvatar(
                        maxRadius: 13,
                        child: Image.network(
                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg")),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: CircleAvatar(
                          maxRadius: 13,
                          child: Image.network(
                              "https://pbs.twimg.com/profile_images/1710650957774667776/ZSaNJ9IX_400x400.jpg")),
                    ),
                  ),
                ]),
              ),
              const Text(
                "new",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 11),
              ),
            ],
          )
        ],
      ),
    );
  }
}
