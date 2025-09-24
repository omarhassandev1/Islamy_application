import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_application/common/app_consts.dart';

import '../../../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.onChanged});

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: AppColors.goldColor,
      style: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: AppConsts.fontFamily,
      ),
      decoration: InputDecoration(
        fillColor: AppColors.blackColor.withValues(alpha: .7),
        filled: true,
        hintText: 'surah name',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.white.withValues(alpha: .5),
          fontWeight: FontWeight.normal,
          fontFamily: AppConsts.fontFamily,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            AppConsts.quranIcon,
            colorFilter: ColorFilter.mode(AppColors.goldColor, BlendMode.srcIn),
          ),
        ),
        border: _getBorder(),
        enabled: true,
        enabledBorder: _getBorder(),
        focusedBorder: _getBorder(),
      ),
    );
  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.goldColor, width: 2),
    );
  }
}
