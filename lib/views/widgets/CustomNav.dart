import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/providers/navBarScreensProvider.dart';

class CustomNav extends ConsumerStatefulWidget {
  const CustomNav({super.key});

  @override
  ConsumerState<CustomNav> createState() => _CustomNavState();
}

class _CustomNavState extends ConsumerState<CustomNav> {
  int currPage = 0;
  double currPos = 15;

  @override
  Widget build(BuildContext context) {
    int currPage = ref.watch(navScreenProvider);

    double width = MediaQuery.of(context).size.width;

    switch (currPage) {
      case 0:
        print(width);
        currPos = (width - 230) / 5;
        print(currPos);

        break;
      case 1:
        // currPos = 115;
        currPos = 2 * ((width - 100) / 5);
        break;
      case 2:
        // currPos = 220;
        currPos = 3 * ((width - 50) / 5);
        break;
      case 3:
        // currPos = 330;
        currPos = 4 * ((width - 25) / 5);
        break;
    }

    return Container(
      height: 80,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () =>
                    ref.watch(navScreenProvider.notifier).changePageAndPos(0),
                child: Image.asset(
                  "assets/images/Home.png",
                  color: (currPage == 0) ? const Color(0xff8B78FF) : null,
                  height: 25,
                ),
              ),
              IconButton(
                  onPressed: () =>
                      ref.watch(navScreenProvider.notifier).changePageAndPos(1),
                  icon: Icon(Icons.calendar_month_sharp,
                      color: (currPage == 1) ? const Color(0xff8B78FF) : null)),
              IconButton(
                  onPressed: () =>
                      ref.watch(navScreenProvider.notifier).changePageAndPos(2),
                  icon: Icon(Icons.add_box_rounded,
                      color: (currPage == 2) ? const Color(0xff8B78FF) : null)),
              IconButton(
                  onPressed: () =>
                      ref.watch(navScreenProvider.notifier).changePageAndPos(3),
                  icon: Icon(Icons.person,
                      color: (currPage == 3) ? const Color(0xff8B78FF) : null)),
              // Image.asset(
              //   "assets/images/Calendar.png",
              //   height: 35,
              // ),
              // Image.asset(
              //   "assets/images/Chat.png",
              //   height: 35,
              // ),
              // Image.asset(
              //   "assets/images/Profile.png",
              //   height: 35,
              // ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 20,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1000),
                  left: currPos,
                  curve: Curves.fastOutSlowIn,
                  child: Image.asset(
                    "assets/images/Vector1.png",
                    height: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
