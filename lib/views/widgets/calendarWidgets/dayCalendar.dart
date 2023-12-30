import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_manager/providers/appointmentsProvider.dart';
import 'package:task_manager/providers/currentDateProvider.dart';
import 'package:task_manager/views/widgets/calendarWidgets/appointmentPop.dart';

class DayCalendar extends ConsumerStatefulWidget {
  const DayCalendar({super.key});

  @override
  ConsumerState<DayCalendar> createState() => _DayCalendarState();
}

class _DayCalendarState extends ConsumerState<DayCalendar> {
  CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    calendarController.displayDate = ref.watch(SelectedDateProvider);
    calendarController.selectedDate = ref.watch(SelectedDateProvider);

    int counter = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SfCalendar(
        view: CalendarView.day,
        selectionDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        initialDisplayDate: ref.watch(SelectedDateProvider),
        initialSelectedDate: ref.watch(SelectedDateProvider),
        viewHeaderHeight: 0,
        dragAndDropSettings: const DragAndDropSettings(
          allowScroll: false,
          allowNavigation: false,
        ),
        controller: calendarController,
        headerHeight: 0,
        allowViewNavigation: false,
        viewNavigationMode: ViewNavigationMode.none,
        cellEndPadding: 10,
        cellBorderColor: Colors.transparent,
        dataSource: _AppointmentDataSource(ref.watch(UserAppointmentsProvider)),
        appointmentBuilder: (context, calendarAppointmentDetails) {
          var appointment = (calendarAppointmentDetails.appointments
              .toList()[counter] as Appointment);

          return AppointmentPop(appointment: appointment);
        },
        showDatePickerButton: false,
        timeSlotViewSettings: const TimeSlotViewSettings(
          // THAT MAY BE AN OPTION IN THE APP THAT THE USER CAN CHANGE
          startHour: 5,
          timeTextStyle: TextStyle(fontSize: 15),
          timeIntervalHeight: 81,
        ),
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];

    appointments.add(Appointment(
      startTime: DateTime.now().subtract(Duration(hours: 2)),
      endTime: DateTime.now().subtract(Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.blue,
      startTimeZone: '',
      endTimeZone: '',
    ));

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
