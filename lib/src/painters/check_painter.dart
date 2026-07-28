import 'package:flutter/material.dart';

/// Paints a custom check mark.
class CheckPainter extends CustomPainter {
  /// Creates a check painter.
  const CheckPainter({
    required this.color,
    this.strokeWidth = 2.5,
    this.progress = 1.0,
  });

  /// Color of the check mark.
  final Color color;

  /// Stroke width.
  final double strokeWidth;

  /// Animation progress (0.0 → 1.0).
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();

    final start = Offset(
      size.width * 0.22,
      size.height * 0.55,
    );

    final middle = Offset(
      size.width * 0.45,
      size.height * 0.75,
    );

    final end = Offset(
      size.width * 0.80,
      size.height * 0.28,
    );

    path.moveTo(start.dx, start.dy);
    path.lineTo(middle.dx, middle.dy);
    path.lineTo(end.dx, end.dy);

    final metric = path.computeMetrics().first;

    final animatedPath = metric.extractPath(
      0,
      metric.length * progress.clamp(0.0, 1.0),
    );

    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(CheckPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.progress != progress;
  }
}