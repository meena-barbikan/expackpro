import 'package:flutter/material.dart';

class ClippathView extends StatefulWidget {
  const ClippathView({super.key});

  @override
  State<ClippathView> createState() => _ClippathViewState();
}

class _ClippathViewState extends State<ClippathView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 200,
        width: 200,
        child: CustomPaint(
          size: Size(200, 200),
          painter: CurvedTrianglePainter(),
          child: Text("data"),
        ),
      ),
    );
  }
}

class CurvedTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.orangeAccent;

    Path path = Path();
    path.moveTo(0, size.height); // Start from bottom-left
    path.lineTo(size.width, 0); // Top-right
    path.lineTo(size.width, size.height); // Bottom-right

    // Curve at the bottom
    path.quadraticBezierTo(size.width, size.height, 0, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
