import 'package:flutter/material.dart';

/// Paints a horizontal dash.
class DashPainter extends CustomPainter {
  /// Creates a dash painter.
  const DashPainter({
    required this.color,
    this.strokeWidth = 2.5,
    this.progress = 1.0,
  });

  /// Dash color.
  final Color color;

  /// Thickness of dash.
  final double strokeWidth;

  /// Animation progress (0.0 → 1.0).
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final start = Offset(
      size.width * 0.25,
      size.height * 0.50,
    );

    final end = Offset(
      size.width * 0.75,
      size.height * 0.50,
    );

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(end.dx, end.dy);

    final metric = path.computeMetrics().first;

    final animatedPath = metric.extractPath(
      0,
      metric.length * progress.clamp(0.0, 1.0),
    );

    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(DashPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.progress != progress;
  }
}