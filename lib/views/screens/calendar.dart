import 'package:flutter/material.dart';
import 'package:task_manager/views/widgets/calendarWidgets/calendarHeader.dart';
import 'package:task_manager/views/widgets/calendarWidgets/dateChanger.dart';
import 'package:task_manager/views/widgets/calendarWidgets/dayCalendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 70),
        CalendarHeader(),
        DateChanger(),
        Expanded(child: DayCalendar())
        // DayCalendar()
      ],
    );
  }
}
