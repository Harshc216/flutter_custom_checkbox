import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../controllers/checkbox_controller.dart';
import '../enums/checkbox_animation.dart';
import '../enums/checkbox_shape.dart';
import '../enums/checkbox_size.dart';
import '../painters/check_painter.dart';
import '../themes/checkbox_theme.dart';
import '../utils/checkbox_extensions.dart';

/// Animated custom checkbox.
class AnimatedCheckbox extends StatefulWidget {
  const AnimatedCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
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

  final CheckboxSize size;
  final CheckboxShape shape;
  final CheckboxAnimation animation;
  final bool enabled;
  final CustomCheckboxThemeData theme;

  @override
  State<AnimatedCheckbox> createState() =>
      _AnimatedCheckboxState();
}

class _AnimatedCheckboxState
    extends State<AnimatedCheckbox>
    with SingleTickerProviderStateMixin {

  late bool _value;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _value = widget.controller?.value ?? widget.value;

    _controller = AnimationController(
      vsync: this,
      duration: widget.theme.animationDuration,
      value: _value ? 1 : 0,
    );

    widget.controller?.addListener(_listener);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  void _listener() {
    setState(() {
      _value = widget.controller!.value;
    });

    _animate();
  }

  void _toggle() {
    if (!widget.enabled) return;

    final value = !_value;

    widget.controller?.setValue(value);

    if (widget.controller == null) {
      setState(() {
        _value = value;
      });

      _animate();
    }

    widget.onChanged?.call(value);
  }

  void _animate() {
    if (_value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;

    return GestureDetector(
      onTap: _toggle,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final Widget checkboxContainer = Container(
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
                ? Center(
                    child: CustomPaint(
                      size: Size.square(
                        theme.iconSize,
                      ),
                      painter: CheckPainter(
                        color: theme.checkColor,
                        progress: _controller.value,
                      ),
                    ),
                  )
                : null,
          );

          switch (widget.animation) {
            case CheckboxAnimation.scale:
              return Transform.scale(
                scale: 0.8 + (_controller.value * 0.2),
                child: checkboxContainer,
              );

            case CheckboxAnimation.rotate:
              return Transform.rotate(
                angle: math.pi * _controller.value,
                child: checkboxContainer,
              );

            case CheckboxAnimation.fade:
              return Opacity(
                opacity: _controller.value,
                child: checkboxContainer,
              );

            case CheckboxAnimation.slide:
              return Transform.translate(
                offset: Offset(
                  10 * (1 - _controller.value),
                  0,
                ),
                child: checkboxContainer,
              );

            case CheckboxAnimation.flip:
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateY(
                    math.pi * (1 - _controller.value),
                  ),
                child: checkboxContainer,
              );

            case CheckboxAnimation.bounce:
              return Transform.scale(
                scale: Curves.elasticOut.transform(
                  _controller.value,
                ),
                child: checkboxContainer,
              );

            case CheckboxAnimation.none:
              return checkboxContainer;
          }
        },
      ),
    );
  }
}