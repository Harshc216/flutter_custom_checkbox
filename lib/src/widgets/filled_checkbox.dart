import 'package:flutter/material.dart';

import '../controllers/checkbox_controller.dart';
import '../enums/checkbox_animation.dart';
import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import '../themes/checkbox_theme.dart';
import '../utils/checkbox_colors.dart';
import 'custom_checkbox.dart';

/// A filled custom checkbox.
class FilledCheckbox extends StatelessWidget {
  const FilledCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.controller,
    this.size = CheckboxSize.medium,
    this.animation = CheckboxAnimation.scale,
    this.enabled = true,
    this.shape = CheckboxShape.square,
    this.fillColor = CheckboxColors.checkedColor,
    this.uncheckedColor = CheckboxColors.uncheckedColor,
    this.checkColor = CheckboxColors.checkColor,
    this.theme = const CustomCheckboxThemeData(),
  });

  final bool value;

  final ValueChanged<bool>? onChanged;

  final CheckboxController? controller;

  final CheckboxSize size;

  final CheckboxAnimation animation;

  final bool enabled;

  final CheckboxShape shape;

  /// Background color when checked.
  final Color fillColor;

  /// Background color when unchecked.
  final Color uncheckedColor;

  /// Check mark color.
  final Color checkColor;

  final CustomCheckboxThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CustomCheckbox(
      value: value,
      onChanged: onChanged,
      controller: controller,
      shape: shape,
      size: size,
      animation: animation,
      enabled: enabled,
      theme: theme.copyWith(
        checkedColor: fillColor,
        uncheckedColor: uncheckedColor,
        checkColor: checkColor,
      ),
    );
  }
}