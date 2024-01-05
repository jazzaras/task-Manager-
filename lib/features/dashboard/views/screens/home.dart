import 'package:flutter/material.dart';
import 'package:task_manager/features/dashboard/views/widgets/info.dart';
import 'package:task_manager/features/dashboard/views/widgets/shortUpdate.dart';

import '../widgets/monthlyPreview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                children: [
                  SizedBox(height: 70),
                  Info(),
                  SizedBox(height: 10),
                  ShortUpdate(),
                  SizedBox(height: 35),
                  MonthlyPreview(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
