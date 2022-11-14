import 'package:flutter/material.dart';
import 'package:silent_moon/pages/choose_topic_page.dart';
import 'package:silent_moon/utils/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = context.orientation;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
        child: orientation == Orientation.portrait
            ? Stack(
                children: [
                  const GetStartedBackground(),
                  const FractionallySizedBox(
                    heightFactor: 0.3,
                    child: GetStartedHeader(),
                  ),
                  Align(
                    alignment: const Alignment(0.0, 0.8),
                    child: ButtonGetStarted(
                        fixedSize: MaterialStateProperty.all(
                          Size(size.width * 0.9, size.height * 0.065),
                        ),
                        textStyle: MaterialStateProperty.all(
                          PrimaryFont.medium(size.height * 0.015),
                        )),
                  ),
                ],
              )
            : Row(
                children: [
                  const Expanded(
                      child: Align(
                    alignment: Alignment.topCenter,
                    child: FractionallySizedBox(
                      heightFactor: 0.8,
                      child: GetStartedHeader(),
                    ),
                  )),
                  Expanded(
                    child: Stack(
                      children: [
                        const GetStartedBackground(),
                        Align(
                          alignment: const Alignment(0.0, 0.8),
                          child: ButtonGetStarted(
                              fixedSize: MaterialStateProperty.all(
                                Size(size.width * 0.3, size.height * 0.065),
                              ),
                              textStyle: MaterialStateProperty.all(
                                PrimaryFont.medium(size.height * 0.015),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ButtonGetStarted extends StatelessWidget {
  const ButtonGetStarted({
    Key? key,
    this.fixedSize,
    this.textStyle,
  }) : super(key: key);

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('$ChooseTopicPage');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          kColorLight,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
        ),
        elevation: MaterialStateProperty.all(4),
        fixedSize: fixedSize,
        foregroundColor: MaterialStateProperty.all(kColorBlack),
        textStyle: textStyle,
      ),
      child: const Text('GET STARTED'),
    );
  }
}

class GetStartedBackground extends StatelessWidget {
  const GetStartedBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = context.orientation;
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: orientation == Orientation.portrait ? 0.6 : 0.9,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          clipBehavior: Clip.antiAlias,
          child: SvgPicture.asset('assets/logo/human.svg'),
        ),
      ),
    );
  }
}

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: SvgPicture.asset(
            'assets/logo/logo_silent_moon.svg',
            alignment: const Alignment(0.0, -0.8),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: FittedBox(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Hi Afsar, Welcome\n',
                  style:
                      PrimaryFont.medium(30).copyWith(color: kColorLightYellow),
                  children: [
                    TextSpan(
                      text: 'to Silent Moon',
                      style: PrimaryFont.thin(28).copyWith(
                        color: kColorLightYellow,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  child: Text(
                    'Explore the app, Find some peace of mind to\n prepare for meditation.',
                    style: PrimaryFont.thin(16).copyWith(
                      color: kColorLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
