import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_manager/Core/providers/UserProvider.dart';
import 'package:task_manager/Core/providers/appointmentsProvider.dart';
import 'package:task_manager/features/dashboard/repository/AppointmentRepository.dart';

final appointmentControllerProvider =
    Provider((ref) => AppointmentController(ref));

class AppointmentController {
  AppointmentController(this.ref);

  ProviderRef ref;

  Future<void> getAppointments() async {
    var userAppointments =
        await ref.watch(appointmentRepositoryProvider).getAppointments();
    // we get every appointment as a map from the data base..
    // so here i will make it a appointemt object
    List realAppointments = userAppointments.map((m) {
      // m stands for map

      // the regex for spliting  the data because it came in another format theat we want it in .. from the data base
      final re = RegExp('[-T:]');

      var tAS = m['starttime']
          .split(re)
          .map((e) => int.parse(e))
          .toList(); // time as string

      var state = m['state'];
      var description = m['description'];

      var name = m['Name'];
      var startTime = DateTime(tAS[0], tAS[1], tAS[2], tAS[3], tAS[4]);
      var endTime = startTime.add(Duration(hours: m['duration']));
      var notes = jsonEncode({"state": state, "description": description});

      // var endtime = m['endtime']
      return Appointment(
        subject: name,
        startTime: startTime,
        endTime: endTime,
        notes: notes,
      );
    }).toList();
    ref
        .watch(UserAppointmentsProvider.notifier)
        .setAppointments(realAppointments);
  }
}
