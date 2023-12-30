import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_manager/views/screens/tabs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://dbjmvgitmjhfkksklaqi.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRiam12Z2l0bWpoZmtrc2tsYXFpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM3ODIzMzMsImV4cCI6MjAxOTM1ODMzM30.-Hqm7xWoK7grDWi_Bami6NSrX6-KuGJObzIEjXIUsvY",
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData(),
      home: const TabsScreen(),
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.black),
        iconColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
          fontSize: 10, color: Colors.black, fontWeight: FontWeight.normal),
    ),
    useMaterial3: true,
    iconTheme: const IconThemeData(color: Color(0xffD4E1F5)),
  );
}
