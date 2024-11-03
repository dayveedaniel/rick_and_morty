// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavouriteStore on FavouriteStoreBase, Store {
  late final _$errorMessageAtom =
      Atom(name: 'FavouriteStoreBase.errorMessage', context: context);

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

  late final _$isFavouriteAtom =
      Atom(name: 'FavouriteStoreBase.isFavourite', context: context);

  @override
  bool get isFavourite {
    _$isFavouriteAtom.reportRead();
    return super.isFavourite;
  }

  @override
  set isFavourite(bool value) {
    _$isFavouriteAtom.reportWrite(value, super.isFavourite, () {
      super.isFavourite = value;
    });
  }

  late final _$toggleFavouriteAsyncAction =
      AsyncAction('FavouriteStoreBase.toggleFavourite', context: context);

  @override
  Future<void> toggleFavourite() {
    return _$toggleFavouriteAsyncAction.run(() => super.toggleFavourite());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isFavourite: ${isFavourite}
    ''';
  }
}
