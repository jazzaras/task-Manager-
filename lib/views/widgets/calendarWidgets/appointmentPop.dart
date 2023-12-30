import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentPop extends StatefulWidget {
  const AppointmentPop({super.key, required this.appointment});

  final Appointment appointment;

  @override
  State<AppointmentPop> createState() => _AppointmentPopState();
}

class _AppointmentPopState extends State<AppointmentPop> {
  @override
  Widget build(BuildContext context) {
    // getting the json String stored in the notes as a String
    final notes = json.decode(widget.appointment.notes!);

    // getting the text for the time interval of the appointment
    var timeInter =
        "${widget.appointment.startTime.hour}.${widget.appointment.startTime.minute.toString().padLeft(2, '0')} - ${widget.appointment.endTime.hour}.${widget.appointment.endTime.minute.toString().padLeft(2, '0')}";

    return FlipCard(
      speed: 750,
      direction: FlipDirection.VERTICAL,
      front: Container(
        height: 100,
        margin: const EdgeInsets.only(left: 10),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: (notes['state'] == 'ip')
                ? [const Color(0xff8B78FF), const Color(0xff5451D6)]
                : [
                    const Color.fromARGB(255, 175, 175, 175),
                    const Color.fromARGB(255, 124, 124, 124)
                  ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.appointment.subject,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  timeInter,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
      back: AnimatedContainer(
          height: 100,
          margin: const EdgeInsets.only(left: 10),
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10, left: 15, right: 0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: (notes['state'] == 'ip')
                  ? [const Color(0xff8B78FF), const Color(0xff5451D6)]
                  : [
                      const Color.fromARGB(255, 175, 175, 175),
                      const Color.fromARGB(255, 124, 124, 124)
                    ],
            ),
          ),
          duration: const Duration(milliseconds: 500),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: AutoSizeText(
                  "descripsion of app descripsion of apent descripsion of appointment",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.mode_rounded),
                    onPressed: () {},
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          notes['state'] =
                              (notes['state'] == 'ip') ? 'd' : 'ip';

                          widget.appointment.notes = jsonEncode(notes);
                        });
                      },
                      icon: Icon(notes['state'] == 'ip'
                          ? Icons.check_box_outline_blank
                          : Icons.check_box))
                ],
              )
            ],
          )),
    );
  }
}
