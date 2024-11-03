part of 'package:test_task/features/characters/presentation/character_details_page.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconPath,
  });

  final String title;
  final String? subtitle;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    final newIconPath = iconPath ??
        (subtitle == null
            ? null
            : '${IconAssetsPaths.baseIconPath}/${title.toLowerCase()}_${subtitle?.toLowerCase()}.svg');
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.p10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSwitcher(
            duration: duration300ms,
            child: newIconPath == null
                ? const Shimmer(
                    height: Sizes.p40,
                    width: Sizes.p40,
                    shape: BoxShape.circle,
                  )
                : Container(
                    height: Sizes.p40,
                    width: Sizes.p40,
                    decoration: const BoxDecoration(
                      color: AppColors.irishBlue,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      newIconPath,
                      fit: BoxFit.scaleDown,
                      colorFilter: const ColorFilter.mode(
                        AppColors.whiteSmoke,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
          ),
          gapW20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.body2,
              ),
              AnimatedSwitcher(
                duration: duration300ms,
                child: subtitle == null
                    ? const Shimmer(
                        height: Sizes.p20,
                        width: Sizes.p100,
                      )
                    : Text(
                        subtitle!,
                        style: AppTextStyles.subtitle,
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
