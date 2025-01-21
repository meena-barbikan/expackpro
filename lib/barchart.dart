import 'package:flutter/material.dart';

class BarChartSample extends StatefulWidget {
  const BarChartSample({super.key});

  @override
  State<BarChartSample> createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  Offset? _tooltipPosition;
  String? _tooltipText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MouseRegion(
              onHover: (details) {
                RenderBox box = context.findRenderObject() as RenderBox;
                Offset localPosition = box.globalToLocal(details.position);

                MultiColorBarChartPainter.showSectionTooltip(
                  localPosition,
                  context,
                  (position, text) {
                    setState(() {
                      _tooltipPosition = position;
                      _tooltipText = text;
                    });
                  },
                  () {
                    setState(() {
                      _tooltipPosition = null;
                      _tooltipText = null;
                    });
                  },
                );
              },
              onExit: (_) {
                setState(() {
                  _tooltipPosition = null;
                  _tooltipText = null;
                });
              },
              child: CustomPaint(
                size: const Size(double.infinity, 350),
                painter: MultiColorBarChartPainter(),
              ),
            ),
            if (_tooltipPosition != null && _tooltipText != null)
              Positioned(
                left: _tooltipPosition!.dx,
                top: _tooltipPosition!.dy,
                child: Material(
                  elevation: 4.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _tooltipText!,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MultiColorBarChartPainter extends CustomPainter {
  final List<List<double>> barSections = [
    [200, 150, 150],
    [300, 200, 300],
    [400, 200, 200],
    [500, 300, 100],
    [350, 350, 300],
  ];

  final List<Color> sectionColors = [Colors.red, Colors.green, Colors.blue];

  static List<Rect> _barSectionRects = [];

  @override
  void paint(Canvas canvas, Size size) {
    const double barWidth = 30.0;
    const double barSpacing = 30.0;
    final double maxHeight = size.height - 50;
    const double yAxisWidth = 50.0;

    final Paint paint = Paint();
    _barSectionRects.clear();

    const int numberOfLabels = 5;
    const double maxValue = 800;
    final double labelSpacing = maxHeight / numberOfLabels;

    for (int i = 0; i <= numberOfLabels; i++) {
      double yPosition = maxHeight - (i * labelSpacing);
      String labelText = '${(i * (maxValue / numberOfLabels)).toInt()}k';

      final TextSpan labelSpan = TextSpan(
        text: labelText,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      );
      final TextPainter textPainter = TextPainter(
        text: labelSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(10, yPosition - 6));

      paint.color = Colors.grey.withOpacity(0.3);
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        Offset(yAxisWidth, yPosition),
        Offset(size.width, yPosition),
        paint,
      );
    }

    for (int i = 0; i < barSections.length; i++) {
      double startX = yAxisWidth + i * (barWidth + barSpacing);
      double startY = size.height - 50;

      for (int j = 0; j < barSections[i].length; j++) {
        paint.color = sectionColors[j];
        final double barHeight = (barSections[i][j] / maxValue) * maxHeight;

        Rect sectionRect = Rect.fromLTWH(
          startX,
          startY - barHeight,
          barWidth,
          barHeight,
        );
        _barSectionRects.add(sectionRect);

        canvas.drawRect(sectionRect, paint);

        startY -= barHeight;
      }

      const TextSpan labelSpan = TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 14),
      );
      final TextPainter textPainter = TextPainter(
        text: labelSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(startX + (barWidth - textPainter.width) / 2, size.height - 40),
      );
    }
  }

  static void showSectionTooltip(
    Offset hoverPosition,
    BuildContext context,
    void Function(Offset position, String text) showTooltip,
    void Function() hideTooltip,
  ) {
    for (int i = 0; i < _barSectionRects.length; i++) {
      if (_barSectionRects[i].contains(hoverPosition)) {
        int barIndex = i ~/ 3;
        int sectionIndex = i % 3;

        String tooltipText =
            'Bar ${barIndex + 1}, Section ${sectionIndex + 1}, Value: ${sectionIndex * 100 + 200}';
        showTooltip(hoverPosition, tooltipText);
        return;
      }
    }
    hideTooltip();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
