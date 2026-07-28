import 'package:flutter/material.dart';

import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import 'checkbox_constants.dart';

/// Converts [CheckboxSize] into actual pixel values.
extension CheckboxSizeExtension on CheckboxSize {
  double get value {
    switch (this) {
      case CheckboxSize.small:
        return CheckboxConstants.smallSize;

      case CheckboxSize.medium:
        return CheckboxConstants.defaultSize;

      case CheckboxSize.large:
        return CheckboxConstants.largeSize;

      case CheckboxSize.extraLarge:
        return CheckboxConstants.extraLargeSize;
    }
  }
}

/// Converts [CheckboxShape] into a BorderRadius.
extension CheckboxShapeExtension on CheckboxShape {
  BorderRadius get borderRadius {
    switch (this) {
      case CheckboxShape.square:
        return BorderRadius.zero;

      case CheckboxShape.rounded:
        return BorderRadius.circular(
          CheckboxConstants.borderRadius,
        );

      case CheckboxShape.circle:
        return BorderRadius.circular(999);

      case CheckboxShape.rectangle:
        return BorderRadius.circular(4);

      case CheckboxShape.diamond:
        return BorderRadius.zero;
    }
  }
}