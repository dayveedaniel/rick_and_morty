import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_task/assets/app_colors.dart';
import 'package:test_task/assets/app_sizes.dart';
import 'package:test_task/assets/asset_paths.dart';
import 'package:test_task/assets/text_styles.dart';
import 'package:test_task/features/characters/presentation/character_details_store/character_details_store.dart';
import 'package:test_task/features/common_widgets/network_image.dart';
import 'package:test_task/features/common_widgets/shimmer_widget.dart';
import 'package:test_task/utils/consts.dart';

part 'package:test_task/features/characters/presentation/widgets/character_details_row.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({super.key});

  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final store = context.read<CharacterDetailsStore>();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p20,
          vertical: Sizes.p20,
        ),
        child: Observer(
          builder: (context) {
            return Column(
              children: [
                DetailsRow(
                  title: 'Name',
                  subtitle: store.character?.name,
                  iconPath: IconAssetsPaths.info,
                ),
                DetailsRow(
                  title: 'Status',
                  subtitle: store.character?.status,
                ),
                DetailsRow(
                  title: 'Species',
                  subtitle: store.character?.species,
                ),
                DetailsRow(
                  title: 'Gender',
                  subtitle: store.character?.gender,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final character = context.read<CharacterDetailsStore>().characterModel;
    return AppBar(
      leadingWidth: Sizes.p60,
      leading: CupertinoButton(
        onPressed: () => Navigator.maybePop(context),
        padding: EdgeInsets.zero,
        child: Container(
          height: Sizes.p60,
          width: Sizes.p60,
          margin: const EdgeInsets.only(left: Sizes.p20),
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      flexibleSpace: Hero(
        tag: character.id,
        child: CustomNetworkImage(
          imagePath: character.image,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Sizes.p260);
}
