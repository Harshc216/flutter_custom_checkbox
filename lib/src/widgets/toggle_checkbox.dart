import 'package:flutter/material.dart';

import '../controllers/checkbox_controller.dart';
import '../enums/checkbox_animation.dart';
import '../services/checkbox_animation_service.dart';
import '../themes/checkbox_theme.dart';

/// Toggle style checkbox.
class ToggleCheckbox extends StatefulWidget {
  const ToggleCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.controller,
    this.enabled = true,
    this.width = 52,
    this.height = 30,
    this.showCheckIcon = true,
    this.animation = CheckboxAnimation.slide,
    this.theme = const CustomCheckboxThemeData(),
  });

  final bool value;

  final ValueChanged<bool>? onChanged;

  final CheckboxController? controller;

  final bool enabled;

  final double width;

  final double height;

  final bool showCheckIcon;

  final CheckboxAnimation animation;

  final CustomCheckboxThemeData theme;

  @override
  State<ToggleCheckbox> createState() =>
      _ToggleCheckboxState();
}

class _ToggleCheckboxState
    extends State<ToggleCheckbox> {

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

    final thumbSize = widget.height - 6;

    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: CheckboxAnimationService.duration(
          customDuration: theme.animationDuration,
        ),
        curve: CheckboxAnimationService.curve(
          widget.animation,
        ),
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: _value
              ? theme.checkedColor
              : theme.uncheckedColor,
          borderRadius: BorderRadius.circular(
            widget.height,
          ),
          border: Border.all(
            color: theme.borderColor,
            width: theme.borderWidth,
          ),
        ),
        child: AnimatedAlign(
          duration: CheckboxAnimationService.duration(
            customDuration: theme.animationDuration,
          ),
          alignment: _value
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: widget.showCheckIcon && _value
                ? Icon(
              Icons.check,
              size: thumbSize * 0.55,
              color: theme.checkedColor,
            )
                : null,
          ),
        ),
      ),
    );
  }
}