import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:silent_moon/pages/choose_topic_page.dart';
import 'package:silent_moon/pages/home_page.dart';
import 'package:silent_moon/utils/theme.dart';

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
      home: const HomePage(),
      initialRoute: '$HomePage',
      routes: {
        '$HomePage': (_) => const HomePage(),
        '$ChooseTopicPage': (_) => const ChooseTopicPage(),
      },
    );
  }
}
