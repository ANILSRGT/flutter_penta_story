import 'package:hive_flutter/hive_flutter.dart';
import 'package:penta_story/core/configs/enums/app_cache_keys_enum.dart';

final class AppCache {
  AppCache._init();
  static final AppCache _instance = AppCache._init();
  static AppCache get I => _instance;

  late final Box<dynamic> _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('app_cache');
  }

  Future<void> put(AppCacheKeysEnum key, dynamic value) async {
    await _box.put(key.key, value);
  }

  T? get<T>(AppCacheKeysEnum key) {
    return _box.get(key.key) as T?;
  }

  T getOrDefault<T>(AppCacheKeysEnum key, T defaultValue) {
    return _box.get(key.key, defaultValue: defaultValue) as T;
  }

  Future<void> delete(AppCacheKeysEnum key) async {
    await _box.delete(key.key);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
