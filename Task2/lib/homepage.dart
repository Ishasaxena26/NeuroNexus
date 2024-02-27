import 'package:alarm_app/add_alarm.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alarm',
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          child: AnalogClock(
            decoration: BoxDecoration(
              border: Border.all(width: 3.0, color: Colors.black),
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            isLive: true,
            hourHandColor: Colors.white,
            minuteHandColor: Colors.white,
            showSecondHand: true,
            numberColor: Colors.white,
            showNumbers: true,
            textScaleFactor: 1.0,
            showTicks: true,
            showDigitalClock: true,
            digitalClockColor: Colors.white,
            datetime: DateTime.now(),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(50),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const AddAlarmScreen()));
          },
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
