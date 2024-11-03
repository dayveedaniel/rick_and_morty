import 'package:flutter/material.dart';
import 'package:test_task/assets/app_sizes.dart';
import 'package:test_task/features/common_widgets/shimmer_widget.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      fit: BoxFit.cover,
      loadingBuilder: (
        BuildContext context,
        Widget child,
        loadingProgress,
      ) {
        return loadingProgress == null
            ? child
            : const Shimmer(
                height: Sizes.p160,
                width: double.maxFinite,
              );
      },
    );
  }
}
