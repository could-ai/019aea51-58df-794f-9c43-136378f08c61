import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/officer_list_screen.dart';
import 'screens/appraisal_tracking_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Officer Appraisal System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/officers': (context) => const OfficerListScreen(),
        '/tracking': (context) => const AppraisalTrackingScreen(),
      },
    );
  }
}
