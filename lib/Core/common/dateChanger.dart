import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:task_manager/Core/providers/currentDateProvider.dart';
import 'package:task_manager/Core/common/singlDay.dart';
import 'package:quiver/time.dart';

class DateChanger extends ConsumerStatefulWidget {
  const DateChanger({super.key});

  @override
  ConsumerState<DateChanger> createState() => _DateChangerState();
}

class _DateChangerState extends ConsumerState<DateChanger> {
  final ItemScrollController _scrollController = new ItemScrollController();

  var currMonth = DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    if (currMonth == 13) {
      currMonth = 1;
    } else if (currMonth == 0) {
      currMonth = 12;
    }
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            currMonth--;
                          });
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.black,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              DateFormat("MMMM")
                                  .format(DateTime(0, (currMonth - 1))),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            currMonth++;
                          });
                        },
                        child: Row(
                          children: [
                            Text(DateFormat("MMMM")
                                .format(DateTime(0, (currMonth + 1)))),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.black,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    DateFormat("MMM").format(DateTime(0, currMonth)),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 127,
          child: ScrollablePositionedList.builder(
            addSemanticIndexes: true,
            itemScrollController: _scrollController,
            initialScrollIndex: ref.watch(SelectedDateProvider).day - 1,
            scrollDirection: Axis.horizontal,
            itemCount: daysInMonth(DateTime.now().year, currMonth),
            itemBuilder: (BuildContext context, int index) {
              print(currMonth);
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    ref
                        .watch(SelectedDateProvider.notifier)
                        .setDateByDay(day: index + 1);

                    // selectedDay = index + 1;
                  });
                },
                child: SingleDay(
                    isSelected: (index + 1 ==
                                ref.watch(SelectedDateProvider).day &&
                            currMonth == ref.watch(SelectedDateProvider).month)
                        ? true
                        : false,
                    dayNum: (index + 1).toString(),
                    dayName: DateFormat("EEE").format(
                        DateTime(DateTime.now().year, currMonth, index + 1))),
              );
            },
          ),
        )
        // SingleChildScrollView(
        //   controller: _scrollController,
        //   scrollDirection: Axis.horizontal,
        //   child: const Row(
        //     children: [
        //       SingleDay(
        //         isSelected: false,
        //         dayNum: "5",
        //         dayName: "Sun",
        //       ),
        //       SizedBox(width: 20),
        //       SingleDay(
        //         isSelected: true,
        //         dayNum: "5",
        //         dayName: "Sun",
        //       ),
        //       SizedBox(width: 20),
        //       SingleDay(
        //         isSelected: false,
        //         dayNum: "5",
        //         dayName: "Sun",
        //       ),
        //       SizedBox(width: 20),
        //       SingleDay(
        //         isSelected: false,
        //         dayNum: "5",
        //         dayName: "Sun",
        //       ),
        //       SizedBox(width: 20),
        //       SingleDay(
        //         isSelected: false,
        //         dayNum: "5",
        //         dayName: "Sun",
        //       ),
        //       SizedBox(width: 20),
        //       SingleDay(
        //         isSelected: false,
        //         dayNum: "5",
        //         dayName: "Sun",
        //       ),
        //       SizedBox(width: 20),
        //       SingleDay(
        //         isSelected: false,
        //         dayNum: "5",
        //         dayName: "Sun",
        //       ),
        //       SizedBox(width: 20),
        //       SingleDay(
        //         isSelected: false,
        //         dayNum: "5",
        //         dayName: "Sun",
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}
