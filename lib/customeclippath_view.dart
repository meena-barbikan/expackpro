import 'package:expackpro/riverpod/screendesign.dart';
import 'package:flutter/material.dart';

class CustomeclippathView extends StatefulWidget {
  const CustomeclippathView({super.key});

  @override
  State<CustomeclippathView> createState() => _CustomeclippathViewState();
}

class _CustomeclippathViewState extends State<CustomeclippathView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomPaint(
          painter: RPSCustomPainter(),
          child: Text("data"),
        )
        //  ClipPath(
        //     clipper: traiangle(),
        //     child: Container(
        //       color: Colors.amber,
        //     )),
        );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    Path path = Path();
    path.moveTo(size.width / 2, size.height / 2);
    // Path path_0 = Path();
    // path_0.moveTo(size.width * -0.0037500, size.height * 0.6912500);
    // path_0.lineTo(size.width * 0.2818500, size.height * 0.4962500);
    // path_0.lineTo(size.width * 0.5343875, size.height * 0.3074875);
    // path_0.lineTo(size.width * 0.6911375, size.height * 0.1899625);
    // path_0.lineTo(size.width * 0.9288125, size.height * 0.0091375);
    canvas.drawPath(path, paint);
    // canvas.drawPath(path_0, paint_fill_0);

    // // Layer 1

    // Paint paint_stroke_0 = Paint()
    //   ..color = const Color.fromARGB(255, 33, 150, 243)
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.00
    //   ..strokeCap = StrokeCap.butt
    //   ..strokeJoin = StrokeJoin.miter;

    // canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class traiangle extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();

    path.moveTo(size.width / 2, size.height / 2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class homepageclippath extends StatefulWidget {
  const homepageclippath({super.key});

  @override
  State<homepageclippath> createState() => _homepageclippathState();
}

class _homepageclippathState extends State<homepageclippath> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          //Text("data"),
          ClipPath(
            clipper: topContainerdesign(),
            child: const Text("data"),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.orange,
            ),
          ),
          const SizedBox(
            child: Text(
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              "All Your Books in one plave on Readium",
              style: TextStyle(
                  color: Color.fromARGB(255, 59, 59, 71), fontSize: 30),
            ),
          ),
          ClipPath(
            child: Text("data"),
            clipper: Rightsidedesign(),
          )
        ],
      ),
    );
  }
}

class Rightsidedesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.25);
    path.moveTo(size.width * 0.25, 0);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.10,
        size.width * 0.20, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.20,
        size.width * 0.35, size.height * 0.25);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class topContainerdesign extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.25);
    path.moveTo(size.width * 0.25, 0);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.10,
        size.width * 0.20, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.20,
        size.width * 0.35, size.height * 0.25);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class SliverappBardesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Slivers Example'),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 100.0,
                color: Colors.green,
                child: Center(child: Text('Static Content')),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('List Item #$index'),
                  );
                },
                childCount: 10,
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.blue,
                    child: Center(child: Text('Grid Item #$index')),
                  );
                },
                childCount: 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
