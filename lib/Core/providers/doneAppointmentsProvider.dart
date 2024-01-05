import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:syncfusion_flutter_calendar/calendar.dart";

class UserAppointments extends StateNotifier<List<Appointment>> {
  UserAppointments()
      : super([
          Appointment(
            startTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 12),
            endTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 14),
            subject: "Buy a new screen",
            color: Color.fromARGB(255, 36, 36, 180),
          ),
          Appointment(
            startTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 12),
            endTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 14),
            subject: "Study for the exam",
            color: Color.fromARGB(255, 36, 36, 180),
          ),
          // Appointment(
          //   startTime: DateTime(DateTime.now().year, DateTime.now().month,
          //       DateTime.now().add(Duration(days: 1)).day, 12),
          //   endTime: DateTime(DateTime.now().year, DateTime.now().month,
          //       DateTime.now().add(Duration(days: 1)).day, 14),
          //   subject: "Make a Task Manager App",
          //   color: Color.fromARGB(255, 36, 36, 180),
          // ),
          Appointment(
            startTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 19),
            endTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 21),
            subject: "Attend meeting",
            color: Color.fromARGB(255, 36, 36, 180),
          ),
        ]);

  void addAppointment({
    startTime,
    endTime,
    subject,
    required Color color,
    startTimeZone,
    endTimeZone,
  }) {
    Appointment appointment = Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: subject,
      color: color,
    );

    state = [appointment, ...state];
  }
}

class CustomAppointment {
  final bool done;
  final DateTime startTime;
  final DateTime endTime;
  final String subject;
  final Color color;
  Appointment? appointment;
  CustomAppointment({
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.color,
    required this.done,
  }) {
    appointment = Appointment(
        startTime: startTime, endTime: endTime, subject: subject, color: color);
  }

  Appointment getAppointment() {
    return appointment!;
  }
}

final DoneUserAppointmentsProvider =
    StateNotifierProvider<UserAppointments, List<Appointment>>(
        (ref) => UserAppointments());
