import "dart:convert";

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
            subject: "finish Database Assignment",
            notes: jsonEncode({"state": "ip"}),
            color: Color.fromARGB(255, 36, 36, 180),
          ),
          Appointment(
            startTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 12),
            endTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 14),
            subject: "Submit Database Assignment",
            notes: jsonEncode({"state": "d"}),
            color: Color.fromARGB(255, 36, 36, 180),
          ),
          Appointment(
            startTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().add(Duration(days: 1)).day, 12),
            endTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().add(Duration(days: 1)).day, 14),
            notes: jsonEncode({"state": "d"}),
            subject: "Make a Task Manager App",
            color: Color.fromARGB(255, 36, 36, 180),
          ),
          Appointment(
            startTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 19),
            endTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 21),
            notes: jsonEncode({"state": "ip"}),
            subject: "Attend Workshop",
            color: Color.fromARGB(255, 36, 36, 180),
          ),
        ]);

  void addAppointment(
      {required DateTime startTime,
      required DateTime endTime,
      required String subject,
      required Color color,
      required List notes}) {
    Appointment appointment = Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: subject,
        color: color,
        notes: notes.toString());
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

final UserAppointmentsProvider =
    StateNotifierProvider<UserAppointments, List<Appointment>>(
        (ref) => UserAppointments());
