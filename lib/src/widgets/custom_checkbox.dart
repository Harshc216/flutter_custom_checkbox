import 'package:flutter/material.dart';

import '../controllers/checkbox_controller.dart';
import '../enums/checkbox_animation.dart';
import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import '../painters/check_painter.dart';
import '../services/checkbox_animation_service.dart';
import '../themes/checkbox_theme.dart';
import '../utils/checkbox_extensions.dart';

/// Base custom checkbox widget.
class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.controller,
    this.shape = CheckboxShape.square,
    this.size = CheckboxSize.medium,
    this.animation = CheckboxAnimation.scale,
    this.enabled = true,
    this.theme = const CustomCheckboxThemeData(),
  });

  final bool value;

  final ValueChanged<bool>? onChanged;

  final CheckboxController? controller;

  final CheckboxShape shape;

  final CheckboxSize size;

  final CheckboxAnimation animation;

  final bool enabled;

  final CustomCheckboxThemeData theme;

  @override
  State<CustomCheckbox> createState() =>
      _CustomCheckboxState();
}

class _CustomCheckboxState
    extends State<CustomCheckbox> {

  late bool _value;

  @override
  void initState() {
    super.initState();

    _value = widget.controller?.value ?? widget.value;

    widget.controller?.addListener(_controllerListener);
  }

  @override
  void didUpdateWidget(CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value &&
        widget.controller == null) {
      _value = widget.value;
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(
      _controllerListener,
    );

    super.dispose();
  }

  void _controllerListener() {
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

    final double checkboxSize =
        widget.size.value;

    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration:
        CheckboxAnimationService.duration(
          customDuration:
          theme.animationDuration,
        ),
        curve: CheckboxAnimationService.curve(
          widget.animation,
        ),
        width: checkboxSize,
        height: checkboxSize,
        decoration: BoxDecoration(
          color: _value
              ? theme.checkedColor
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