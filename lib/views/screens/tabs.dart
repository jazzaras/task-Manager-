import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/providers/navBarScreensProvider.dart';
import 'package:task_manager/views/screens/auth.dart';
import 'package:task_manager/views/screens/calendar.dart';
import 'package:task_manager/views/screens/addApointment.dart';
import 'package:task_manager/views/screens/home.dart';
import 'package:task_manager/views/widgets/CustomNav.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  List screens = const [
    HomeScreen(),
    CalendarScreen(),
    AddApointmentScreen(),
    AuthScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffE5E5E5),
      body: screens[ref.watch(navScreenProvider)],
      bottomNavigationBar: CustomNav(),
    );
  }
}
