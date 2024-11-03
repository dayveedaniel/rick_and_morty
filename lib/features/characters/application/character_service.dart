import 'package:injectable/injectable.dart';
import 'package:test_task/data/local/shared_prefs/shared_prefs_provider.dart';
import 'package:test_task/data/remote/http/api_provider.dart';
import 'package:test_task/features/characters/domain/character_info_model.dart';
import 'package:test_task/features/characters/domain/character_model.dart';

@injectable
class CharacterService {
  CharacterService(this._apiProvider);

  final ApiProvider _apiProvider;

  Future<List<CharacterModel>> getCharacters() async {
    final result = await _apiProvider.getCharacterList();
    return List<CharacterModel>.of(
      result.map(
        (character) => CharacterModel.fromJson(character),
      ),
    );
  }

  Future<CharacterDetailsModel> getCharacterDetails(int id) async {
    final result = await _apiProvider.getDetails(id: id);
    return CharacterDetailsModel.fromJson(result);
  }
}
