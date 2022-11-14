import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silent_moon/utils/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              _LogoSilentMoon(),
              Expanded(flex: 2, child: _HomeHeader()),
              Expanded(
                flex: 5,
                child: SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: _HeaderThumb(
                            color: kColorPrimary,
                            title: 'Basics',
                            subtitle: 'COURSE',
                            colorButton: kColorLight,
                            width: size.width),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: _HeaderThumb(
                          color: kColorYellow,
                          title: 'Relaxation',
                          subtitle: 'MUSIC',
                          colorButton: kColorBlack,
                          width: size.width,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: _PlayDailyThrought(size: size),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: kColorBlack,
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _HeaderThumb(
      {required Color color,
      required String title,
      required String subtitle,
      required Color colorButton,
      required double width}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: SvgPicture.asset(
              'assets/image/home_page_thumb_1.svg',
              alignment: Alignment.topRight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('$title'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('$subtitle'),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '3-10 MINS',
                  style: TextStyle(color: kColorBlack),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'START',
                    style: TextStyle(color: kColorBlack),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      kColorLight,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class _PlayDailyThrought extends StatelessWidget {
  const _PlayDailyThrought({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: size.width,
              child: SvgPicture.asset(
                'assets/home/play_background.svg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 24.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily Thought',
                        style:
                            PrimaryFont.medium(20).copyWith(color: kColorLight),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'MEDITATION 3-10 MIN',
                        style:
                            PrimaryFont.thin(12).copyWith(color: kColorLight),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(size.width);
                    },
                    child: Icon(Icons.play_arrow_rounded,
                        color: kColorBlack, size: 32),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8),
                      backgroundColor: kColorLight,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LogoSilentMoon extends StatelessWidget {
  const _LogoSilentMoon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: SvgPicture.asset(
        'assets/logo/logo_silent_moon_black.svg',
        alignment: const Alignment(0.0, -0.8),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Text(
          'Good Moring, Afsar',
          style: PrimaryFont.bold(24).copyWith(
            height: 1.8,
          ),
        )),
        Expanded(
            child: Text(
          'We Wish you have a good day',
          style: PrimaryFont.thin(20).copyWith(
            height: 1.2,
          ),
        )),
      ],
    );
  }
}
