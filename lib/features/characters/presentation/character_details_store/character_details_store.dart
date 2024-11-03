import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:test_task/features/characters/application/character_service.dart';
import 'package:test_task/features/characters/domain/character_info_model.dart';
import 'package:test_task/features/characters/domain/character_model.dart';
import 'package:test_task/utils/log_service.dart';

part 'character_details_store.g.dart';

@injectable
class CharacterDetailsStore extends CharacterDetailsStoreBase
    with _$CharacterDetailsStore {
  CharacterDetailsStore(
    super.service,
    @factoryParam super.characterModel,
  );
}

abstract class CharacterDetailsStoreBase with Store {
  CharacterDetailsStoreBase(
    this._service,
    this.characterModel,
  );

  final CharacterService _service;
  final CharacterModel characterModel;

  @observable
  String? errorMessage;

  @observable
  CharacterDetailsModel? character;

  @action
  Future<void> getCharacterDetails() async {
    try {
      character = await _service.getCharacterDetails(characterModel.id);
    } catch (error, trace) {
      errorMessage = error.toString();
      println('Error Fetching Characters $error Trace $trace');
    }
  }
}
