import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_manager/Core/Constants/colorsConstants.dart';
import 'package:task_manager/Core/providers/UserProvider.dart';
import 'package:task_manager/Core/providers/navBarScreensProvider.dart';
import 'package:task_manager/features/auth/views/auth.dart';
import 'package:task_manager/features/dashboard/views/screens/calendar.dart';
import 'package:task_manager/features/addAppointment/views/addApointment.dart';
import 'package:task_manager/features/dashboard/views/screens/home.dart';
import 'package:task_manager/views/screens/profile.dart';
import 'package:task_manager/Core/common/CustomNav.dart';

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
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Session? session = ref.watch(userSessionProvider);

    return session == null
        ? const AuthScreen()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: MyColors.bgColor,
            body: screens[ref.watch(navScreenProvider)],
            bottomNavigationBar: const CustomNav(),
          );
  }
}
