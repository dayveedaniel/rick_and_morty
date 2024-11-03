import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/assets/app_colors.dart';
import 'package:test_task/assets/app_sizes.dart';
import 'package:test_task/assets/asset_paths.dart';
import 'package:test_task/di/injector.dart';
import 'package:test_task/features/favourite/presentation/store/favourite_store.dart';

class FavouriteButton extends StatelessWidget {
  FavouriteButton({
    super.key,
    required int characterId,
  }) : store = getIt.get<FavouriteStore>(param1: characterId);

  final FavouriteStore store;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: store.toggleFavourite,
      child: Container(
        height: Sizes.p30,
        width: Sizes.p30,
        padding: const EdgeInsets.all(Sizes.p4),
        decoration: const BoxDecoration(
          color: AppColors.whiteSmoke,
          shape: BoxShape.circle,
        ),
        child: Observer(
          builder: (context) => SvgPicture.asset(
            store.isFavourite
                ? IconAssetsPaths.liked
                : IconAssetsPaths.unliked,
          ),
        ),
      ),
    );
  }
}
