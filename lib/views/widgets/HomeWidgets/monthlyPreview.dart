import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/views/widgets/HomeWidgets/popInfoSmall.dart';

class MonthlyPreview extends StatelessWidget {
  const MonthlyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monthly Preview",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    FlipCard(
                      front: PopInfoSmall(
                        hight: 150,
                        number: 22,
                        text: "Done",
                        color: PopColor.green,
                      ),
                      back: PopInfoSmall(
                        hight: 150,
                        color: PopColor.green,
                        child: Text("- \n -Task b \n -Task c \n -Task d"),
                      ),
                    ),
                    SizedBox(height: 15),
                    PopInfoSmall(
                      hight: 100,
                      number: 12,
                      text: "Ongoing",
                      color: PopColor.red,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    PopInfoSmall(
                      hight: 100,
                      number: 7,
                      text: "In Progress",
                      color: PopColor.orange,
                    ),
                    SizedBox(height: 15),
                    PopInfoSmall(
                      hight: 150,
                      number: 14,
                      text: "Waiting For Review",
                      color: PopColor.blue,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
