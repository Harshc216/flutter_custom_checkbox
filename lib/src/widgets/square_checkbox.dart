import 'package:flutter/material.dart';

import '../controllers/checkbox_controller.dart';
import '../enums/checkbox_animation.dart';
import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import '../themes/checkbox_theme.dart';
import 'custom_checkbox.dart';

/// A square shaped custom checkbox.
class SquareCheckbox extends StatelessWidget {
  const SquareCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.controller,
    this.size = CheckboxSize.medium,
    this.animation = CheckboxAnimation.scale,
    this.enabled = true,
    this.theme = const CustomCheckboxThemeData(),
  });

  final bool value;

  final ValueChanged<bool>? onChanged;

  final CheckboxController? controller;

  final CheckboxSize size;

  final CheckboxAnimation animation;

  final bool enabled;

  final CustomCheckboxThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CustomCheckbox(
      value: value,
      onChanged: onChanged,
      controller: controller,
      shape: CheckboxShape.square,
      size: size,
      animation: animation,
      enabled: enabled,
      theme: theme,
    );
  }
}