import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_manager/Core/providers/UserProvider.dart';

final appointmentRepositoryProvider =
    Provider((ref) => AppointmentRepository(ref));

class AppointmentRepository {
  AppointmentRepository(this.ref);

  ProviderRef ref;

  Future<List> getAppointments() async {
    final _future = await Supabase.instance.client
        .from('appointments')
        .select()
        .eq("userid", ref.watch(userSessionProvider)!.user.id);

    return _future;
    // final countries = _future.data!;
  }
}
