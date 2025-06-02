import 'dart:ui';

import 'package:receipe_finder_and_meal_planner/core/constants/app_colors.dart';

final class AppConstants {
  /// Hero Tags
  static const String imageTag = "imageTag";

  // static const TextStyle primaryTextStyle() => TextStyle(
  //   fontWeight: FontWeight.w500,
  //   color: AppColors.white,
  //   fontSize: 18,
  // );

  static TextStyle defaultTextStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  static TextStyle blackTextStyle() => TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 18,
  );
}
