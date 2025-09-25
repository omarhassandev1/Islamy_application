import 'package:flutter/material.dart';
import 'package:islami_application/theme/app_colors.dart';

class ResetSebhaButton extends StatelessWidget {
  const ResetSebhaButton({super.key, required this.resetSebha});

  final void Function() resetSebha;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: resetSebha,
      backgroundColor: AppColors.greyColor,
      child: Icon(Icons.replay, color: AppColors.goldColor),
    );
  }


}
