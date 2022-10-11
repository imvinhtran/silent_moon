import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:silent_moon/data/model/topic.model.dart';

abstract class TopicStorage {
  Future<List<Topic>> load();
}

class AssetTopicStorage extends TopicStorage {
  @override
  Future<List<Topic>> load() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonContent = await rootBundle.loadString("mock/topics/topics.json");
    final List<dynamic> jsonData = jsonDecode(jsonContent);
    return jsonData.map((e) => Topic.fromJson(e)).toList();
  }
}
