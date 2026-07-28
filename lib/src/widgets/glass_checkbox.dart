import 'dart:ui';

import 'package:flutter/material.dart';

import '../controllers/checkbox_controller.dart';
import '../enums/checkbox_animation.dart';
import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import '../painters/check_painter.dart';
import '../services/checkbox_animation_service.dart';
import '../themes/checkbox_theme.dart';
import '../utils/checkbox_extensions.dart';

/// Glassmorphism checkbox.
class GlassCheckbox extends StatefulWidget {
  const GlassCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.controller,
    this.size = CheckboxSize.medium,
    this.shape = CheckboxShape.rounded,
    this.animation = CheckboxAnimation.scale,
    this.enabled = true,
    this.blur = 8,
    this.opacity = .25,
    this.theme = const CustomCheckboxThemeData(),
  });

  final bool value;

  final ValueChanged<bool>? onChanged;

  final CheckboxController? controller;

  final CheckboxSize size;

  final CheckboxShape shape;

  final CheckboxAnimation animation;

  final bool enabled;

  /// Blur amount.
  final double blur;

  /// Background opacity.
  final double opacity;

  final CustomCheckboxThemeData theme;

  @override
  State<GlassCheckbox> createState() =>
      _GlassCheckboxState();
}

class _GlassCheckboxState extends State<GlassCheckbox> {
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
      child: ClipRRect(
        borderRadius: widget.shape.borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.blur,
            sigmaY: widget.blur,
          ),
          child: AnimatedContainer(
            duration:
            CheckboxAnimationService.duration(
              customDuration:
              theme.animationDuration,
            ),
            curve:
            CheckboxAnimationService.curve(
              widget.animation,
            ),
            width: widget.size.value,
            height: widget.size.value,
            decoration: BoxDecoration(
              color: _value
                  ? theme.checkedColor.withValues(
                alpha: widget.opacity,
              )
                  : Colors.white.withValues(
                alpha: widget.opacity,
              ),
              borderRadius:
              widget.shape.borderRadius,
              border: Border.all(
                color: Colors.white.withValues(
                  alpha: 0.4,
                ),
                width: theme.borderWidth,
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(
                    alpha: 0.15,
                  ),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
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
        ),
      ),
    );
  }
}