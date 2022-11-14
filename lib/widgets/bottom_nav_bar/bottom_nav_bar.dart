import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silent_moon/pages/reminder_page.dart';
import 'package:silent_moon/utils/theme.dart';
import 'package:stacked/stacked.dart';
import 'package:silent_moon/pages/home_page.dart';
import 'package:silent_moon/pages/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kColorLight,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            _ItemNavBar(
                title: 'Home',
                icon: Icon(Icons.home_outlined),
                iconActive: Icon(
                  Icons.home_outlined,
                  color: kColorLight,
                )),
            _ItemNavBar(
                title: 'Sleep',
                icon: Icon(Icons.dark_mode_outlined),
                iconActive: Icon(
                  Icons.dark_mode_outlined,
                  color: kColorLight,
                )),
            _ItemNavBar(
                title: 'Meditate',
                icon: Icon(Icons.notifications_none),
                iconActive: Icon(
                  Icons.notifications_none,
                  color: kColorLight,
                )),
            _ItemNavBar(
                title: 'Music',
                icon: Icon(Icons.music_note),
                iconActive: Icon(
                  Icons.music_note,
                  color: kColorLight,
                )),
            _ItemNavBar(
                title: 'Afsar',
                icon: Icon(Icons.person_outline),
                iconActive: Icon(
                  Icons.person_outline,
                  color: kColorLight,
                )),
          ],
        ),
      ),
      viewModelBuilder: () {
        return HomeViewModel();
      },
    );
  }

  BottomNavigationBarItem _ItemNavBar(
      {required String title, required Icon icon, required Icon iconActive}) {
    return BottomNavigationBarItem(
        label: title,
        icon: Padding(
          padding: const EdgeInsets.all(4.0),
          child: icon,
        ),
        backgroundColor: kColorLight,
        activeIcon: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kColorPrimary,
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: iconActive,
          ),
        ));
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return ReminderPage();
      default:
        return HomePage();
    }
  }
}
