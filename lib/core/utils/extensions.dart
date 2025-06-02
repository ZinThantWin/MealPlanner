import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:receipe_finder_and_meal_planner/core/constants/app_colors.dart';

extension CustomBox on double {
  Widget widthBox() {
    return SizedBox(width: this);
  }
}

extension CustomBox2 on int {
  Widget widthBox() {
    return SizedBox(width: toDouble());
  }

  Widget heightBox() {
    return SizedBox(height: toDouble());
  }

  Widget loadingWidget({Color color = AppColors.white}) =>
      LoadingAnimationWidget.discreteCircle(color: color, size: toDouble());
}

extension StringCasingExtension on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
