// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailsStore on CharacterDetailsStoreBase, Store {
  late final _$errorMessageAtom =
      Atom(name: 'CharacterDetailsStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$characterAtom =
      Atom(name: 'CharacterDetailsStoreBase.character', context: context);

  @override
  CharacterDetailsModel? get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(CharacterDetailsModel? value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  late final _$getCharacterDetailsAsyncAction = AsyncAction(
      'CharacterDetailsStoreBase.getCharacterDetails',
      context: context);

  @override
  Future<void> getCharacterDetails() {
    return _$getCharacterDetailsAsyncAction
        .run(() => super.getCharacterDetails());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
character: ${character}
    ''';
  }
}
