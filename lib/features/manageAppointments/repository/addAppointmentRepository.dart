import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

final addAppointmentRepositoryProvider =
    Provider((ref) => AddAppointmentRepository());

class AddAppointmentRepository {
  Future<void> addAppointment(
      {required String name,
      required DateTime starttime,
      required int duration,
      required String description}) async {
    final supabase = Supabase.instance.client;

    // Inserting appointment details into tables
    await supabase.from("appointments").insert({
      "appointmentid": const Uuid().v1(),
      "userid": supabase.auth.currentUser!.id,
      "Name": name,
      "starttime": starttime.toIso8601String(),
      "duration": duration,
      "description": description
    });
  }
}
