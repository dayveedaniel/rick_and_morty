import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/di/injector.dart';
import 'package:test_task/features/characters/presentation/character_details_page.dart';
import 'package:test_task/features/characters/presentation/character_details_store/character_details_store.dart';
import 'package:test_task/features/characters/presentation/characters_list_store/characters_store.dart';
import 'package:test_task/features/characters/presentation/characters_page.dart';

abstract class AppRouter {
  AppRouter._();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharactersPage.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return Provider(
              create: (_) => getIt.get<CharactersStore>()..getCharacters(),
              child: const CharactersPage(),
            );
          },
          settings: settings,
        );

      case CharacterDetailsPage.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return Provider(
              create: (_) => getIt.get<CharacterDetailsStore>(
                param1: settings.arguments,
              )..getCharacterDetails(),
              child: const CharacterDetailsPage(),
            );
          },
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const Material(
              child: Center(
                child: Text("Invalid Route"),
              ),
            );
          },
        );
    }
  }
}
