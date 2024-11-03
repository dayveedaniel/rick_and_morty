import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_task/assets/app_colors.dart';
import 'package:test_task/assets/app_sizes.dart';
import 'package:test_task/assets/text_styles.dart';
import 'package:test_task/features/characters/domain/character_model.dart';
import 'package:test_task/features/characters/presentation/characters_list_store/characters_store.dart';
import 'package:test_task/features/common_widgets/network_image.dart';
import 'package:test_task/features/common_widgets/shimmer_widget.dart';
import 'package:test_task/features/favourite/presentation/favourite_button.dart';
import 'package:test_task/utils/consts.dart';

import 'character_details_page.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final store = context.read<CharactersStore>();

    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (context) {
          final itemCount =
              store.characters.isEmpty ? 8 : store.characters.length;
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.p20,
                  vertical: Sizes.p20,
                ),
                sliver: SliverGrid.builder(
                  itemCount: itemCount,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: Sizes.p180,
                    mainAxisExtent: Sizes.p240,
                    mainAxisSpacing: Sizes.p10,
                    crossAxisSpacing: Sizes.p20,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      AnimatedSwitcher(
                    duration: duration300ms,
                    child: store.characters.isEmpty
                        ? const Shimmer()
                        : CharacterTile(
                            characterModel: store.characters[index],
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    super.key,
    required this.characterModel,
  });

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.p12),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            color: AppColors.white,
            minSize: double.maxFinite,
            alignment: Alignment.centerLeft,
            onPressed: () => Navigator.pushNamed(
              context,
              CharacterDetailsPage.routeName,
              arguments: characterModel,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: characterModel.id,
                  child: CustomNetworkImage(
                    imagePath: characterModel.image,
                  ),
                ),
                gapH12,
                Padding(
                  padding: const EdgeInsets.only(left: Sizes.p10),
                  child: Text(
                    characterModel.name,
                    style: AppTextStyles.body1.apply(
                      color: AppColors.nero,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: Sizes.p10,
          right: Sizes.p10,
          child: FavouriteButton(
            characterId: characterModel.id,
          ),
        ),
      ],
    );
  }
}
