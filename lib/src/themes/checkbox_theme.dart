import 'package:flutter/material.dart';

import '../utils/checkbox_colors.dart';
import '../utils/checkbox_constants.dart';

/// Defines the appearance of a custom checkbox.
@immutable
class CustomCheckboxThemeData {
  /// Creates a checkbox theme.
  const CustomCheckboxThemeData({
    this.checkedColor = CheckboxColors.checkedColor,
    this.uncheckedColor = CheckboxColors.uncheckedColor,
    this.borderColor = CheckboxColors.borderColor,
    this.checkColor = CheckboxColors.checkColor,
    this.disabledColor = CheckboxColors.disabledColor,
    this.errorColor = CheckboxColors.errorColor,
    this.borderWidth = CheckboxConstants.borderWidth,
    this.borderRadius = CheckboxConstants.borderRadius,
    this.iconSize = CheckboxConstants.iconSize,
    this.elevation = CheckboxConstants.elevation,
    this.shadowColor = CheckboxColors.shadowColor,
    this.animationDuration = CheckboxConstants.animationDuration,
  });

  /// Background color when checked.
  final Color checkedColor;

  /// Background color when unchecked.
  final Color uncheckedColor;

  /// Border color.
  final Color borderColor;

  /// Check icon color.
  final Color checkColor;

  /// Disabled color.
  final Color disabledColor;

  /// Error color.
  final Color errorColor;

  /// Border thickness.
  final double borderWidth;

  /// Border radius.
  final double borderRadius;

  /// Check icon size.
  final double iconSize;

  /// Shadow elevation.
  final double elevation;

  /// Shadow color.
  final Color shadowColor;

  /// Animation duration.
  final Duration animationDuration;

  /// Creates a copy with updated values.
  CustomCheckboxThemeData copyWith({
    Color? checkedColor,
    Color? uncheckedColor,
    Color? borderColor,
    Color? checkColor,
    Color? disabledColor,
    Color? errorColor,
    double? borderWidth,
    double? borderRadius,
    double? iconSize,
    double? elevation,
    Color? shadowColor,
    Duration? animationDuration,
  }) {
    return CustomCheckboxThemeData(
      checkedColor: checkedColor ?? this.checkedColor,
      uncheckedColor: uncheckedColor ?? this.uncheckedColor,
      borderColor: borderColor ?? this.borderColor,
      checkColor: checkColor ?? this.checkColor,
      disabledColor: disabledColor ?? this.disabledColor,
      errorColor: errorColor ?? this.errorColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      iconSize: iconSize ?? this.iconSize,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      animationDuration:
      animationDuration ?? this.animationDuration,
    );
  }
}