import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class SharedPreferenceProvider {
  late final SharedPreferencesWithCache _prefsWithCache;

  Future<void> init() async {
    _prefsWithCache = await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(
        allowList: StorageKeys.keys,
      ),
    );
  }

  List<String>? readData(String key) => _prefsWithCache.getStringList(key);

  Future<void> updateData({
    required String key,
    required List<String> data,
  }) =>
      _prefsWithCache.setStringList(key, data);

  Future<void> deleteData(String key) => _prefsWithCache.remove(key);

  Future<void> clearStorage() => _prefsWithCache.clear();
}

enum StorageKeys {
  favourite;

  static Set<String> get keys =>
      StorageKeys.values.map((key) => key.name).toSet();
}
