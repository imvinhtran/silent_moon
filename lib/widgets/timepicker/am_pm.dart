import 'package:flutter/cupertino.dart';
import 'package:silent_moon/utils/theme.dart';

class AmPm extends StatelessWidget {
  AmPm({required this.isItAm});

  final bool isItAm;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          isItAm ? 'AM' : 'PM',
          style: TextStyle(fontSize: 24, color: kColorBlack),
        ),
      ),
    );
  }
}
