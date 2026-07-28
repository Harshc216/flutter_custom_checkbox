import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

import '../controllers/checkbox_controller.dart';
import '../enums/checkbox_animation.dart';
import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import '../painters/check_painter.dart';
import '../services/checkbox_animation_service.dart';
import '../themes/checkbox_theme.dart';
import '../utils/checkbox_extensions.dart';

/// Soft UI (Neumorphism) checkbox.
class NeumorphismCheckbox extends StatefulWidget {
  const NeumorphismCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.controller,
    this.size = CheckboxSize.medium,
    this.shape = CheckboxShape.rounded,
    this.animation = CheckboxAnimation.scale,
    this.enabled = true,
    this.theme = const CustomCheckboxThemeData(),
    this.backgroundColor = const Color(0xFFEAEAEA),
    this.lightShadow = Colors.white,
    this.darkShadow = const Color(0xFFBEBEBE),
    this.shadowBlur = 8,
    this.shadowDistance = 4,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final CheckboxController? controller;

  final CheckboxSize size;
  final CheckboxShape shape;
  final CheckboxAnimation animation;
  final bool enabled;

  final CustomCheckboxThemeData theme;

  /// Surface colour.
  final Color backgroundColor;

  /// Top-left shadow.
  final Color lightShadow;

  /// Bottom-right shadow.
  final Color darkShadow;

  /// Shadow blur.
  final double shadowBlur;

  /// Shadow offset.
  final double shadowDistance;

  @override
  State<NeumorphismCheckbox> createState() =>
      _NeumorphismCheckboxState();
}

class _NeumorphismCheckboxState
    extends State<NeumorphismCheckbox> {

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
        duration: CheckboxAnimationService.duration(
          customDuration: theme.animationDuration,
        ),
        curve: CheckboxAnimationService.curve(
          widget.animation,
        ),
        width: widget.size.value,
        height: widget.size.value,
        decoration: BoxDecoration(
          color: _value
              ? theme.checkedColor
              : widget.backgroundColor,
          borderRadius: widget.shape.borderRadius,
          boxShadow: _value
              ? [
            BoxShadow(
              color: widget.darkShadow,
              offset: Offset(
                widget.shadowDistance / 2,
                widget.shadowDistance / 2,
              ),
              blurRadius: widget.shadowBlur / 2,
              inset: true,
            ),
          ]
              : [
            BoxShadow(
              color: widget.lightShadow,
              offset: Offset(
                -widget.shadowDistance,
                -widget.shadowDistance,
              ),
              blurRadius: widget.shadowBlur,
            ),
            BoxShadow(
              color: widget.darkShadow,
              offset: Offset(
                widget.shadowDistance,
                widget.shadowDistance,
              ),
              blurRadius: widget.shadowBlur,
            ),
          ],
        ),
        child: _value
            ? Center(
          child: CustomPaint(
            size: Size.square(theme.iconSize),
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