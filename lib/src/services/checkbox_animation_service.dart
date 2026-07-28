import 'package:flutter/material.dart';

import '../enums/checkbox_animation.dart';
import '../utils/checkbox_constants.dart';

/// Provides animation configuration for checkbox widgets.
class CheckboxAnimationService {
  CheckboxAnimationService._();

  /// Returns animation duration.
  static Duration duration({
    Duration? customDuration,
  }) {
    return customDuration ??
        CheckboxConstants.animationDuration;
  }

  /// Returns animation curve.
  static Curve curve(
      CheckboxAnimation animation,
      ) {
    switch (animation) {
      case CheckboxAnimation.none:
        return Curves.linear;

      case CheckboxAnimation.scale:
        return Curves.easeInOut;

      case CheckboxAnimation.bounce:
        return Curves.bounceOut;

      case CheckboxAnimation.fade:
        return Curves.easeIn;

      case CheckboxAnimation.rotate:
        return Curves.easeInOutBack;

      case CheckboxAnimation.flip:
        return Curves.fastOutSlowIn;

      case CheckboxAnimation.slide:
        return Curves.easeOut;
    }
  }

  /// Beginning scale value.
  static double beginScale(
      CheckboxAnimation animation,
      ) {
    switch (animation) {
      case CheckboxAnimation.scale:
        return 0.8;

      case CheckboxAnimation.bounce:
        return 0.6;

      default:
        return 1.0;
    }
  }

  /// Ending scale value.
  static double endScale(
      CheckboxAnimation animation,
      ) {
    return 1.0;
  }
}