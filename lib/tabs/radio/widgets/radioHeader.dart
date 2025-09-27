import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class RadioHeader extends StatelessWidget {
  RadioHeader({super.key, this.children});

  List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blackColor.withValues(alpha: .7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: children ?? []),
    );
  }
}
