import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(AlarmClockApp());
}

class AlarmClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlarmClockHomePage(),
    );
  }
}

class AlarmClockHomePage extends StatefulWidget {
  @override
  _AlarmClockHomePageState createState() => _AlarmClockHomePageState();
}

class _AlarmClockHomePageState extends State<AlarmClockHomePage> {
  TimeOfDay _selectedTime = TimeOfDay(hour: 0, minute: 0);
  bool _alarmSet = false;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _alarmSet = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm Clock'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _alarmSet
                ? Text(
                    'Alarm set for ${_selectedTime.format(context)}',
                    style: TextStyle(fontSize: 20.0),
                  )
                : Text(
                    'No alarm set',
                    style: TextStyle(fontSize: 20.0),
                  ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Set Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
