import 'package:flutter/cupertino.dart';
import 'package:silent_moon/utils/theme.dart';

class MyMinutes extends StatelessWidget {
  MyMinutes({required this.mins});

  final int mins;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          mins < 10 ? '0' + mins.toString() : mins.toString(),
          style: TextStyle(fontSize: 28, color: kColorBlack),
        ),
      ),
    );
  }
}
