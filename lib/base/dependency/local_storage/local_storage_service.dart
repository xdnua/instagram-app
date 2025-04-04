import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  late final Box box;
  LocalStorageService();

  Future<void> initialize() async {
    box = await Hive.openBox('task_manager');
  }

  Future put(String key, dynamic value) {
    return box.put(key, value);
  }

  String? getString(String key) {
    return box.get(key) as String?;
  }

  bool? getBool(String key) {
    return box.get(key) as bool?;
  }

  int? getInt(String key) {
    return box.get(key) as int?;
  }

  List<String>? getStringList(String key) {
    return box.get(key) as List<String>?;
  }

  Future delete(dynamic key) {
    return box.delete(key);
  }

  bool containsKey(String key) {
    return box.containsKey(key);
  }

  Future<int> clear() {
    return box.clear();
  }
}
