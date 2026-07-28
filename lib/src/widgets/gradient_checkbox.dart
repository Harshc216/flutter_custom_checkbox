import 'package:flutter/material.dart';

import '../controllers/checkbox_controller.dart';
import '../enums/checkbox_animation.dart';
import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import '../painters/check_painter.dart';
import '../services/checkbox_animation_service.dart';
import '../themes/checkbox_theme.dart';
import '../utils/checkbox_extensions.dart';

/// A checkbox with gradient background.
class GradientCheckbox extends StatefulWidget {
  const GradientCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.gradient,
    this.controller,
    this.size = CheckboxSize.medium,
    this.shape = CheckboxShape.rounded,
    this.animation = CheckboxAnimation.scale,
    this.enabled = true,
    this.theme = const CustomCheckboxThemeData(),
  });

  final bool value;

  final ValueChanged<bool>? onChanged;

  final CheckboxController? controller;

  final Gradient gradient;

  final CheckboxSize size;

  final CheckboxShape shape;

  final CheckboxAnimation animation;

  final bool enabled;

  final CustomCheckboxThemeData theme;

  @override
  State<GradientCheckbox> createState() =>
      _GradientCheckboxState();
}

class _GradientCheckboxState
    extends State<GradientCheckbox> {

  late bool _value;

  @override
  void initState() {
    super.initState();

    _value = widget.controller?.value ?? widget.value;

    widget.controller?.addListener(_listener);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    setState(() {
      _value = widget.controller!.value;
    });
  }

  void _toggle() {
    if (!widget.enabled) return;

    final newValue = !_value;

    widget.controller?.setValue(newValue);

    if (widget.controller == null) {
      setState(() {
        _value = newValue;
      });
    }

    widget.onChanged?.call(newValue);
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;

    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: CheckboxAnimationService.duration(),
        curve: CheckboxAnimationService.curve(
          widget.animation,
        ),
        width: widget.size.value,
        height: widget.size.value,
        decoration: BoxDecoration(
          gradient: _value
              ? widget.gradient
              : null,
          color: _value
              ? null
              : theme.uncheckedColor,
          borderRadius:
          widget.shape.borderRadius,
          border: Border.all(
            color: theme.borderColor,
            width: theme.borderWidth,
          ),
        ),
        child: _value
            ? Center(
          child: CustomPaint(
            size: Size.square(
              theme.iconSize,
            ),
            painter: CheckPainter(
              color: theme.checkColor,
            ),
          ),
        )
            : null,
      ),
    );
  }
}