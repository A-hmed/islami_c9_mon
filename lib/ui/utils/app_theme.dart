import 'package:flutter/material.dart';
import 'package:islami_c9_mon/ui/utils/app_colors.dart';

abstract class AppTheme{
  static const TextStyle appBarTextStyle = TextStyle(fontWeight: FontWeight.bold,
   fontSize: 30, color: AppColors.accent);
  static const TextStyle suraNameTextStyle = TextStyle(fontWeight: FontWeight.w600,
      fontSize: 25, color: AppColors.accent);
}