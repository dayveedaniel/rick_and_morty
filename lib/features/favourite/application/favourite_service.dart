import 'package:injectable/injectable.dart';
import 'package:test_task/data/local/shared_prefs/shared_prefs_provider.dart';
import 'package:test_task/utils/log_service.dart';

@injectable
class FavouriteService {
  FavouriteService(this._provider);

  final SharedPreferenceProvider _provider;
  final String _key = StorageKeys.favourite.name;

  List<String> get _favouriteList => _provider.readData(_key) ?? [];

  Future<void> addToFavourite(int characterId) async {
    try {
      await _provider.updateData(
        key: _key,
        data: _favouriteList..add(characterId.toString()),
      );
    } catch (error, trace) {
      println('Error adding to favourites $error Trace: $trace');
      rethrow;
    }
  }

  Future<void> removeFromFavourite(int characterId) async {
    try {
      await _provider.updateData(
        key: _key,
        data: _favouriteList..remove(characterId.toString()),
      );
    } catch (error, trace) {
      println('Error removing favourites $error Trace: $trace');
      rethrow;
    }
  }

  bool isFavourite(int characterId) {
    try {
      return _favouriteList.contains(characterId.toString());
    } catch (error, trace) {
      println('Error in isFavourite $error Trace: $trace');
      rethrow;
    }
  }
}
