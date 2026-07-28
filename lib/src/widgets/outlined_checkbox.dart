import 'package:flutter/material.dart';

import '../controllers/checkbox_controller.dart';
import '../enums/checkbox_animation.dart';
import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import '../themes/checkbox_theme.dart';
import '../utils/checkbox_colors.dart';
import 'custom_checkbox.dart';

/// A custom outlined checkbox.
class OutlinedCheckbox extends StatelessWidget {
  const OutlinedCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.controller,
    this.size = CheckboxSize.medium,
    this.animation = CheckboxAnimation.scale,
    this.enabled = true,
    this.shape = CheckboxShape.square,
    this.theme = const CustomCheckboxThemeData(),
  });

  final bool value;

  final ValueChanged<bool>? onChanged;

  final CheckboxController? controller;

  final CheckboxSize size;

  final CheckboxAnimation animation;

  final bool enabled;

  final CheckboxShape shape;

  final CustomCheckboxThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CustomCheckbox(
      value: value,
      onChanged: onChanged,
      controller: controller,
      size: size,
      animation: animation,
      enabled: enabled,
      shape: shape,
      theme: theme.copyWith(
        uncheckedColor: Colors.transparent,
        borderColor: CheckboxColors.borderColor,
      ),
    );
  }
}