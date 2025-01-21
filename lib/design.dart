import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Design extends StatefulWidget {
  const Design({super.key});

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding:
            const EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 10),
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 193, 194, 210),
                shape: BoxShape.circle,
              ),
              width: 300,
              height: 300,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Bottom Card
                  Positioned(
                    top: 100,
                    left: -40,

                    // bottom: 02,
                    child: CardWidget(
                      color: Colors.red.shade100,
                      icon: Icons.dashboard,
                      title: "Dashboard mobile app",
                      tasks: "42 Task",
                    ),
                  ),
                  // Middle Card
                  Positioned(
                    top: 60,
                    right: 80,
                    // bottom: 02,
                    child: CardWidget(
                      color: Colors.blue.shade100,
                      icon: Icons.wifi,
                      title: "Develop mobile app",
                      tasks: "35 Task",
                    ),
                  ),
                  // Top Card
                  Positioned(
                    top: 20,
                    left: 160,
                    child: CardWidget(
                      color: Colors.purple.shade100,
                      icon: Icons.edit,
                      title: "A content for mobile app project",
                      tasks: "12 Task",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: SizedBox(
                child: Column(
                  children: [
                    Text(
                      "Managing Your",
                      style: GoogleFonts.redRose(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Project Is Easy Now",
                      style: GoogleFonts.redRose(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 38,
            ),
            child: Text(
              maxLines: 3,
              "Are you tired of mixed projects, we are hero for you as hawk workspace. you can relax  while we do our job",
              style: GoogleFonts.redRose(
                  fontSize: 18, color: Colors.grey.shade400),
            ),
          ),
          Gap(15),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: 5,
              effect: SwapEffect(),
            ),
          ),
          Gap(20),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String tasks;

  const CardWidget({
    required this.color,
    required this.icon,
    required this.title,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            SizedBox(height: 16),
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            // Tasks and Progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tasks,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LargeHalfCirclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                colors: [
              const Color.fromARGB(255, 2, 53, 85),
              const Color.fromARGB(255, 107, 109, 110)
            ])),
        child: Stack(
          children: [
            // Large half-circle design
            Align(
              alignment: Alignment.center,
              child: CustomPaint(
                size: Size(
                    700,
                    (1000)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
            ),

            // Page content
            Center(
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 2, 53, 85)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0033333, size.height * 0.1460700);
    path_0.quadraticBezierTo(size.width * 0.1311500, size.height * 0.1394800,
        size.width * 0.2141333, size.height * 0.1543900);
    path_0.cubicTo(
        size.width * 0.2176958,
        size.height * 0.1554550,
        size.width * 0.2248208,
        size.height * 0.1575850,
        size.width * 0.2283833,
        size.height * 0.1586500);
    path_0.cubicTo(
        size.width * 0.2866833,
        size.height * 0.1743300,
        size.width * 0.3250000,
        size.height * 0.1982200,
        size.width * 0.3477167,
        size.height * 0.2213600);
    path_0.cubicTo(
        size.width * 0.3842333,
        size.height * 0.2722600,
        size.width * 0.4020333,
        size.height * 0.3152800,
        size.width * 0.3993667,
        size.height * 0.3832800);
    path_0.cubicTo(
        size.width * 0.4018500,
        size.height * 0.4421600,
        size.width * 0.3957000,
        size.height * 0.4629200,
        size.width * 0.3683333,
        size.height * 0.4980000);
    path_0.cubicTo(
        size.width * 0.3320000,
        size.height * 0.5540000,
        size.width * 0.3071167,
        size.height * 0.5786100,
        size.width * 0.2534500,
        size.height * 0.5969300);
    path_0.quadraticBezierTo(size.width * 0.1844167, size.height * 0.6265100,
        size.width * 0.0058500, size.height * 0.6384400);

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 51, 92, 118)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SemiCircleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color
      body: Stack(
        children: [
          // Semi-Circular Gradient Design
          Align(
            alignment: Alignment.center,
            child: CustomPaint(
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.6,
              ),
              painter: SemiCirclePainter(),
            ),
          ),
          // Content inside the semi-circle
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Jamie,",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "How are you feeling?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 30),
                // Example emotions and icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildEmotion("Joy", Icons.emoji_emotions_outlined),
                    _buildEmotion("Interest", Icons.favorite_outline),
                    _buildEmotion("Anger", Icons.warning_amber_outlined),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmotion(String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 30),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }
}

class SemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.orange, Colors.purple],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCircle(
          center: Offset(size.width, size.height), radius: size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    // Semi-circle path
    Path path = Path();
    path.arcTo(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height),
          radius: size.height * 0.6),
      3.14, // Start angle (π radians = half-circle)
      3.14, // Sweep angle (π radians = half-circle)
      false,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
