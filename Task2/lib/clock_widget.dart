// import 'package:flutter/material.dart';

// class ClockWidget extends StatefulWidget {
//   const ClockWidget({Key? key, required this.onTimeSet}) : super(key: key);

//   final Function(TimeOfDay) onTimeSet;

//   @override
//   _ClockWidgetState createState() => _ClockWidgetState();
// }

// class _ClockWidgetState extends State<ClockWidget> {
//   late TimeOfDay _selectedTime =
//       TimeOfDay.now(); // Change _selectedTime to late

//   @override
//   Widget build(BuildContext context) {
//     // Show the time picker directly when the widget builds
//     _selectTime(context);

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const SizedBox(height: 20.0),
//         Text(
//           'Selected Time: ${_selectedTime.format(context)}',
//           style: const TextStyle(fontSize: 18.0),
//         ),
//         const SizedBox(height: 20.0),
//         ElevatedButton(
//           onPressed: () {
//             widget.onTimeSet(_selectedTime);
//           },
//           child: const Text('Set Alarm'),
//         ),
//       ],
//     );
//   }

//   // Function to select time
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: _selectedTime,
//     );

//     if (picked != null && picked != _selectedTime) {
//       setState(() {
//         _selectedTime = picked;
//       });
//     }
//   }
// }
