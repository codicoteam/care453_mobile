import 'package:flutter/material.dart';
class ChatBubblePainter extends CustomPainter {
  final Color color;

  ChatBubblePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width - 10, size.height) // Start at bottom-right corner
      ..lineTo(size.width - 20, size.height) // Move left for the tail width
      ..lineTo(size.width - 10, size.height - 10) // Draw diagonal line for the tail height
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
