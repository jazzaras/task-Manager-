import 'package:flutter/material.dart';
import 'package:task_manager/views/widgets/AddAppintmentWidgets/Timeselect.dart';
import 'package:task_manager/views/widgets/calendarWidgets/calendarHeader.dart';
import 'package:task_manager/views/widgets/calendarWidgets/dateChanger.dart';

class AddApointmentScreen extends StatefulWidget {
  const AddApointmentScreen({super.key});

  @override
  State<AddApointmentScreen> createState() => _AddApointmentScreenState();
}

class _AddApointmentScreenState extends State<AddApointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 70),
          CalendarHeader(),
          DateChanger(),
          TimeSelect()
        ],
      ),
    );
  }
}
