import 'package:flutter/material.dart';
import 'package:silent_moon/widgets/timepicker/am_pm.dart';
import 'package:silent_moon/widgets/timepicker/hours.dart';
import 'package:silent_moon/widgets/timepicker/minutes.dart';

class TimePickerWheelScroll extends StatefulWidget {
  TimePickerWheelScroll({super.key});

  @override
  State<TimePickerWheelScroll> createState() => _TimePickerWheelScrollState();
}

class _TimePickerWheelScrollState extends State<TimePickerWheelScroll> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = FixedExtentScrollController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Hours
          Container(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: 50,
              perspective: 0.01,
              diameterRatio: 2,
              childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 12,
                  builder: (context, index) {
                    return MyHours(
                      mins: index + 1,
                    );
                  }),
            ),
          ),
          // Minutes
          Container(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              perspective: 0.01,
              diameterRatio: 2,
              childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 60,
                  builder: (context, index) {
                    return MyMinutes(
                      mins: index + 1,
                    );
                  }),
            ),
          ),
          Container(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              perspective: 0.01,
              diameterRatio: 2,
              childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 2,
                  builder: (context, index) {
                    return AmPm(
                      isItAm: index == 0 ? true : false,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
