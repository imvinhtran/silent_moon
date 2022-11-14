import 'package:flutter/material.dart';
import 'package:silent_moon/utils/theme.dart';
import 'package:silent_moon/widgets/timepicker/timepicker_wheel_scroll.dart';

import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';

const dayOfWeek = ["SU", "M", "T", "W", "TH", "F", "S"];

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Expanded(
              flex: 2,
              child: _TimeHeader(
                title: 'What time would you\nlike to meditate?',
                substring:
                    'Any time you can choose but We recommend\nfirst thing in th morning.',
              ),
            ),
            Expanded(
              flex: 3,
              child: DecoratedBox(
                child: TimePickerWheelScroll(),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 50, 50, 112),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: _TimeHeader(
                title: 'Which day would you\nlike to meditate?',
                substring:
                    'Everyday is best, but we recommend picking\nat least five.',
              ),
            ),
            Expanded(
              child: _DaySelect(),
            ),
            Expanded(
              flex: 2,
              child: _Button(screenSize: screenSize),
            ),
          ],
        ),
      ),
    );
  }
}

class _DaySelect extends StatelessWidget {
  const _DaySelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(7, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                child: Center(child: Text(dayOfWeek[index])),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: kColorBlack,
                  ),
                ),
              ),
            ),
          );
        }));
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('$HomeView');
          },
          child: Text('SAVE'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kColorPrimary),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(38),
                ),
              ),
              fixedSize: MaterialStateProperty.all(
                  Size(screenSize.width * 0.9, screenSize.height * 0.06))),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('$HomeView');
          },
          child: Text('NO, THANKS',
              style: PrimaryFont.medium(14).copyWith(color: kColorBlack)),
        ),
      ],
    );
  }
}

class _TimeHeader extends StatelessWidget {
  _TimeHeader({
    Key? key,
    required this.title,
    required this.substring,
  }) : super(key: key);

  final String title;
  final String substring;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: FractionallySizedBox(
            heightFactor: 0.8,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: PrimaryFont.bold(24).copyWith(color: kColorBlack),
              ),
            ),
          )),
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.6,
              alignment: Alignment.topCenter,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  substring,
                  style: PrimaryFont.light(16).copyWith(
                    color: kColorBlack,
                    height: 1.65,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
