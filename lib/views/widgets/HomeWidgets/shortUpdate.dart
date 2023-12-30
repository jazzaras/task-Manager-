import 'package:flutter/material.dart';
import 'package:task_manager/views/widgets/HomeWidgets/popInfoWide.dart';

class ShortUpdate extends StatelessWidget {
  const ShortUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hi Surf",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            "5 Tasks are pending",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          PopInfoWide()
        ],
      ),
    );
  }
}
