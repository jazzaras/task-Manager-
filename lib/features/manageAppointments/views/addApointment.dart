import 'package:flutter/material.dart';
import 'package:task_manager/features/manageAppointments/views/widgets/Timeselect.dart';
import 'package:task_manager/Core/common/calendarHeader.dart';
import 'package:task_manager/Core/common/dateChanger.dart';

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
