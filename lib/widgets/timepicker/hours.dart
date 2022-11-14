import 'package:flutter/cupertino.dart';
import 'package:silent_moon/utils/theme.dart';

class MyHours extends StatelessWidget {
  MyHours({required this.mins});

  final int mins;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          mins.toString(),
          style: TextStyle(fontSize: 28, color: kColorBlack),
        ),
      ),
    );
  }
}
