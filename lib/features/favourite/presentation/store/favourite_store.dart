import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:test_task/features/favourite/application/favourite_service.dart';
import 'package:test_task/utils/log_service.dart';

part 'favourite_store.g.dart';

@injectable
class FavouriteStore extends FavouriteStoreBase with _$FavouriteStore {
  FavouriteStore(
    super.service,
    @factoryParam super.characterId,
  );
}

abstract class FavouriteStoreBase with Store {
  FavouriteStoreBase(
    this._service,
    this.characterId,
  ) : isFavourite = _service.isFavourite(characterId);

  final FavouriteService _service;
  final int characterId;

  @observable
  String? errorMessage;

  @observable
  bool isFavourite;

  @action
  Future<void> toggleFavourite() async {
    try {
      if (isFavourite) {
        await _service.removeFromFavourite(characterId);
      } else {
        await _service.addToFavourite(characterId);
      }
      isFavourite = !isFavourite;
    } catch (error, trace) {
      //Handle error here
      errorMessage = error.toString();
      println('Error changing fav status $error Trace $trace');
    }
  }
}
