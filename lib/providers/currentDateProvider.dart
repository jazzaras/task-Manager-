import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedDate extends StateNotifier<DateTime> {
  SelectedDate() : super(DateTime.now());

  void setDateByDay({required int day}) {
    state = DateTime(state.year, state.month, day);
  }

  // void addDay(int numOfDays) {
  //   state = state.add(Duration(days: numOfDays));
  // }
}

final SelectedDateProvider =
    StateNotifierProvider<SelectedDate, DateTime>((ref) => SelectedDate());
