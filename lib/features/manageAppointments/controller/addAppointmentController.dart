import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/dashboard/controller/AppointmentController.dart';
import 'package:task_manager/features/manageAppointments/repository/addAppointmentRepository.dart';

final AddAppointmentControllerProvider =
    Provider((ref) => AddAppointmentController(ref));

class AddAppointmentController {
  final ProviderRef _ref;

  AddAppointmentController(this._ref);

  Future<void> addAppointment(
      {required String name,
      required DateTime startTime,
      required int duration,
      required String description}) async {
    // Inserting appointment details into tables
    await _ref.read(addAppointmentRepositoryProvider).addAppointment(
          name: name,
          starttime: startTime,
          duration: duration,
          description: description,
        );

    await _ref.read(appointmentControllerProvider).getAppointments();
  }
}
