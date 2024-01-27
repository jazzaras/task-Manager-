import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:syncfusion_flutter_calendar/calendar.dart";

class UserAppointments extends StateNotifier<List<Appointment>?> {
  UserAppointments() : super([]);

  void addAppointment({
    required DateTime startTime,
    required DateTime endTime,
    required String subject,
    required Color color,
  }) {
    Appointment appointment = Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: subject,
      color: color,
      notes: jsonEncode({"state": "ip"}),
    );

    state = [appointment, ...state!];
  }

  void setAppointments(newState) {
    state = newState;
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
    StateNotifierProvider<UserAppointments, List<Appointment>?>(
        (ref) => UserAppointments());
