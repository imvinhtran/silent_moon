import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:silent_moon/pages/choose_topic_page.dart';
import 'package:silent_moon/pages/home_page.dart';
import 'package:silent_moon/pages/welcome_page.dart';
import 'package:silent_moon/pages/reminder_page.dart';
import 'package:silent_moon/utils/theme.dart';
import 'package:silent_moon/widgets/bottom_nav_bar/bottom_nav_bar.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Silent Moon',
      theme: ThemeData(
        primaryColor: kColorPrimary,
      ),
      home: const HomeView(),
      initialRoute: '$Welcome',
      routes: {
        '$Welcome': (_) => const Welcome(),
        '$ChooseTopicPage': (_) => const ChooseTopicPage(),
        '$ReminderPage': (_) => const ReminderPage(),
        '$HomePage': (_) => const HomePage(),
        '$HomeView': (_) => const HomeView(),
      },
    );
  }
}
