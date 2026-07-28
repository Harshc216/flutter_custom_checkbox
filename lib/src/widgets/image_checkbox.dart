import 'package:flutter/material.dart';

import '../controllers/checkbox_controller.dart';
import '../enums/checkbox_animation.dart';
import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import '../services/checkbox_animation_service.dart';
import '../themes/checkbox_theme.dart';
import '../utils/checkbox_extensions.dart';

/// A checkbox that displays any widget when selected.
class ImageCheckbox extends StatefulWidget {
  const ImageCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.child,
    this.controller,
    this.size = CheckboxSize.medium,
    this.shape = CheckboxShape.square,
    this.animation = CheckboxAnimation.scale,
    this.enabled = true,
    this.theme = const CustomCheckboxThemeData(),
  });

  final bool value;

  final ValueChanged<bool>? onChanged;

  /// Widget displayed when checked.
  final Widget child;

  final CheckboxController? controller;

  final CheckboxSize size;

  final CheckboxShape shape;

  final CheckboxAnimation animation;

  final bool enabled;

  final CustomCheckboxThemeData theme;

  @override
  State<ImageCheckbox> createState() =>
      _ImageCheckboxState();
}

class _ImageCheckboxState extends State<ImageCheckbox> {
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
          color: _value
              ? theme.checkedColor
              : theme.uncheckedColor,
          borderRadius: widget.shape.borderRadius,
          border: Border.all(
            color: theme.borderColor,
            width: theme.borderWidth,
          ),
        ),
        child: _value
            ? Center(child: widget.child)
            : null,
      ),
    );
  }
}