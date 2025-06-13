import 'dart:convert';
import 'dart:math';

import 'package:hive_flutter/adapters.dart';

class HiveLocalServices {
  static Box? hive;

  static Future<void> getInstance() async {
    await Hive.initFlutter();
    await Hive.openBox("chats");
    hive = Hive.box("chats");
    print("hive passed success");
  }

  static Future<void> insertData(Map<dynamic, dynamic> map) async {
    await hive?.add(map);
  }

  static Future<void> insertDataWithKey(String value) async {
    await hive?.put(Random().nextInt(1000), value);
  }

  static List<Map<String, dynamic>> readAllData() {
    final values = hive?.values ?? [];

    return values.map<Map<String, dynamic>>((item) {
      if (item is String) {
        return jsonDecode(item) as Map<String, dynamic>;
      } else if (item is Map) {
        return Map<String, dynamic>.fromEntries(
          item.entries.map((e) => MapEntry(e.key.toString(), e.value)),
        );
      } else {
        throw Exception("Unexpected data format: ${item.runtimeType}");
      }
    }).toList();
  }

  static readOneData(String key) {
    return hive?.get(key);
  }

  static updateData(int index, Map<dynamic, dynamic> json) async {
    await hive?.putAt(index, json);
  }

  static Future<void> deleteData(int index) async {
    await hive?.deleteAt(index);
  }

  static Future<void> clearAll() async {
    await hive?.clear();
  }
}
