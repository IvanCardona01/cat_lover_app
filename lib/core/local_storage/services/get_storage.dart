import 'package:get_storage/get_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:cat_lover_app/core/config/env.dart';

class LocalDataService {
  late final GetStorage _box;
  static final String _storageName = Env.storageName;

  LocalDataService._();
  static final LocalDataService _instance = LocalDataService._();
  factory LocalDataService() => _instance;

  Future<void> init() async {
    try {
      await GetStorage.init(_storageName);
      _box = GetStorage(_storageName);
    } catch (e) {
      debugPrint('#Error on LocalDataService connection: ${e.toString()}');
    }
  }

  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  T? read<T>(String key) {
    final value = _box.read(key);
    if (value == null) return null;
    try {
      return value as T;
    } catch (e) {
      debugPrint('Error casting value to type T: $e');
      return null;
    }
  }
}
