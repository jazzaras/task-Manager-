import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/providers/appointmentsProvider.dart';
import 'package:task_manager/providers/currentDateProvider.dart';

class TimeSelect extends ConsumerStatefulWidget {
  const TimeSelect({super.key});

  @override
  ConsumerState<TimeSelect> createState() => _TimeSelectState();
}

class _TimeSelectState extends ConsumerState<TimeSelect> {
  final _globalKey = GlobalKey<FormState>();
  String name = "";
  int hour = 6;
  int minute = 6;
  int duration = 1;
  String description = "";

  void submit() {
    // first we need to check if the DATA is vaild

    _globalKey.currentState!.save();

    // Getting the current Selected Date By the user in the dayCalendar Widget
    DateTime selectedDate = ref.read(SelectedDateProvider);

    // curr time will be taken from
    var startTime = DateTime(
        selectedDate.year, selectedDate.month, selectedDate.day, hour, minute);

    ref.watch(UserAppointmentsProvider.notifier).addAppointment(
      subject: name,
      color: Color.fromARGB(255, 36, 36, 180),
      startTime: startTime,
      endTime: startTime.add(Duration(hours: duration)),
      notes: ["ip"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Name"),
                  onSaved: (newValue) => name = newValue!,
                ),
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: "Hour"),
                        onSaved: (newValue) => hour = int.parse(newValue!),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: "Minute"),
                        onSaved: (newValue) => minute = int.parse(newValue!),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Duration"),
                        onSaved: (newValue) => duration = int.parse(newValue!),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              SizedBox(
                height: 140,
                child: TextFormField(
                  maxLines: 6,
                  decoration: const InputDecoration(
                    labelText: "Description",
                  ),
                  onSaved: (newValue) => description = newValue!,
                ),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: submit,
                child: Text("Add"),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 50),
                  backgroundColor: Colors.white,
                  alignment: Alignment.center,
                  textStyle: TextStyle(fontSize: 18, color: Colors.black),
                ),
              )
            ],
          ),
        ));
  }
}
