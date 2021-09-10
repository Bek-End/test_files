import 'package:flutter/material.dart';
import 'package:test_file/theme/app_colors.dart';

class AppTextStyles {
  static const TextStyle infoStyle = TextStyle(
    fontSize: 12,
    height: 1.6,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.countInfo,
  );
  static const TextStyle fileStyle = TextStyle(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.fileInfo,
  );
}
