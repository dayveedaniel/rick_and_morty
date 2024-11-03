import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:test_task/features/characters/application/character_service.dart';
import 'package:test_task/features/characters/domain/character_model.dart';
import 'package:test_task/utils/log_service.dart';

part 'characters_store.g.dart';

@injectable
class CharactersStore = CharactersStoreBase with _$CharactersStore;

abstract class CharactersStoreBase with Store {
  CharactersStoreBase(this._service);

  final CharacterService _service;

  @observable
  String? errorMessage;

  final ObservableList<CharacterModel> characters =
      ObservableList<CharacterModel>();

  @action
  Future<void> getCharacters() async {
    try {
      characters.addAll(await _service.getCharacters());
    } catch (error, trace) {
      errorMessage = error.toString();
      println('Error Fetching Characters $error Trace $trace');
    }
  }
}
