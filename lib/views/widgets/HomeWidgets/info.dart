import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Monday",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                Text(
                  "25 October",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      color: Colors.grey,
                      Icons.search,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: CircleAvatar(
                      maxRadius: 30,
                      child: Image.network(
                          "https://pbs.twimg.com/profile_images/1710650957774667776/ZSaNJ9IX_400x400.jpg")),
                )
              ],
            )
          ],
        ));
  }
}
