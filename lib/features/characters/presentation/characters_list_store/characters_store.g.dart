// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on CharactersStoreBase, Store {
  late final _$errorMessageAtom =
      Atom(name: 'CharactersStoreBase.errorMessage', context: context);

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

  late final _$getCharactersAsyncAction =
      AsyncAction('CharactersStoreBase.getCharacters', context: context);

  @override
  Future<void> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage}
    ''';
  }
}
