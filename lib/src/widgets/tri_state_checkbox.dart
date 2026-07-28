import 'package:flutter/material.dart';

import '../enums/checkbox_animation.dart';
import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import '../painters/check_painter.dart';
import '../painters/dash_painter.dart';
import '../services/checkbox_animation_service.dart';
import '../themes/checkbox_theme.dart';
import '../utils/checkbox_extensions.dart';

/// Tri-state checkbox.
///
/// false = unchecked
/// true = checked
/// null = indeterminate
class TriStateCheckbox extends StatefulWidget {
  const TriStateCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = CheckboxSize.medium,
    this.shape = CheckboxShape.rounded,
    this.animation = CheckboxAnimation.scale,
    this.enabled = true,
    this.theme = const CustomCheckboxThemeData(),
  });

  final bool? value;

  final ValueChanged<bool?>? onChanged;

  final CheckboxSize size;

  final CheckboxShape shape;

  final CheckboxAnimation animation;

  final bool enabled;

  final CustomCheckboxThemeData theme;

  @override
  State<TriStateCheckbox> createState() =>
      _TriStateCheckboxState();
}

class _TriStateCheckboxState
    extends State<TriStateCheckbox> {

  late bool? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(
      covariant TriStateCheckbox oldWidget,
      ) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _value = widget.value;
    }
  }

  void _toggle() {
    if (!widget.enabled) return;

    bool? newValue;

    if (_value == false) {
      newValue = true;
    } else if (_value == true) {
      newValue = null;
    } else {
      newValue = false;
    }

    setState(() {
      _value = newValue;
    });

    widget.onChanged?.call(newValue);
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;

    final bool checked = _value == true;

    final bool indeterminate = _value == null;

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
          color: checked || indeterminate
              ? theme.checkedColor
              : theme.uncheckedColor,
          borderRadius:
          widget.shape.borderRadius,
          border: Border.all(
            color: theme.borderColor,
            width: theme.borderWidth,
          ),
        ),
        child: Center(
          child: checked
              ? CustomPaint(
            size: Size.square(
              theme.iconSize,
            ),
            painter: CheckPainter(
              color: theme.checkColor,
            ),
          )
              : indeterminate
              ? CustomPaint(
            size: Size.square(
              theme.iconSize,
            ),
            painter: DashPainter(
              color: theme.checkColor,
            ),
          )
              : null,
        ),
      ),
    );
  }
}