import 'package:alarm_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:timezone/browser.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  tz.initializeTimeZones();

  const String timeZoneName = 'Asia/Kolkata';
  tz.setLocalLocation(tz.getLocation(timeZoneName));

  runApp(const AlarmApp());
}

class AlarmApp extends StatelessWidget {
  const AlarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alarms',
      home: HomePage(),
    );
  }
}
