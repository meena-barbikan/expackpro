// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Screendesign extends StatefulWidget {
  const Screendesign({super.key});

  @override
  State<Screendesign> createState() => _ScreendesignState();
}

class _ScreendesignState extends State<Screendesign> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            //  provider.value.toString(),
            "",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ]),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

// final counterProvider = StateProvider<int>((ref) => 0);

// class CounterPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Read the counter value from the provider
//     final int counter = ref.watch(counterProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Riverpod Counter'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Counter Value: $counter'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: () => ref.read(counterProvider.notifier).state++,
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.remove),
//                   onPressed: () => ref.read(counterProvider.notifier).state--,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyCounter extends StatefulWidget {
  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      // Rebuilds the entire widget
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Widget rebuilt!"); // Prints every time `setState` is called
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: $counter"),
            ElevatedButton(
              onPressed: incrementCounter,
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterNotifier extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners(); // Only listeners will rebuild
  }
}

class MyCounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterNotifier =
        Provider.of<CounterNotifier>(context); // Access the notifier
    return Scaffold(
      appBar: AppBar(title: const Text("Counter with Provider")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: ${counterNotifier.counter}"),
            ElevatedButton(
              onPressed: () => counterNotifier.incrementCounter(),
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}

class customappview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Painter Example')),
      body: Center(
        child: CustomPaint(
          size: Size(300, 300), // Canvas size
          painter: circlePaint(),
        ),
      ),

      // traingle, circle, rectangle, path
      // Center(
      //   child: Container(
      //     color: Colors.white,
      //     height: 300,
      //     width: 300,
      //     child: CustomPaint(
      //       // size: Size(300, 300), // Size of the canvas
      //       //  painter: MyCustomPainter(),
      //       //  painter: RectanglePainter(),
      //       //  painter: circlePainter(),
      //       // painter: drawpathline(),
      //       painter: trainglepath(),
      //     ),
      //   ),
      // ),
    );
  }
}

class circlePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // Define the gradient
    final Gradient gradient = LinearGradient(
      colors: [
        Colors.orange,
        Colors.purple,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    // Define a Paint object with gradient
    Paint paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(
            center: Offset(width / 10, height / 2), radius: width / 3.6),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0 // Thickness of the arc
      ..strokeCap = StrokeCap.round; // Smooth rounded edges

    // Draw the semi-circle (half-circle arc)
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(width / 10, height / 2), radius: width / 2),
      1.5 * 3.14, // Starting angle (in radians)
      3.14, // Sweep angle (half-circle is π radians)
      false, // Not a filled shape
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class trainglepath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final panit = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;
    final path = Path();
    path.moveTo(size.height * 1 / 2, size.width * 1 / 2);
    path.lineTo(size.width * 1 / 6, size.height * 3 / 4);
    path.lineTo(size.width * 5 / 6, size.height * 3 / 4);
    path.close();
    canvas.drawPath(path, panit);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class drawpathline extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final panit = Paint()
      ..color = Colors.orange
      ..strokeWidth = 10;
    final arc1 = Path();
    arc1.moveTo(size.height * 0.2, size.width * 0.2);
    arc1.arcToPoint(Offset(size.width * 0.8, size.height * 0.2),
        radius: const Radius.circular(120), clockwise: false);
    canvas.drawPath(arc1, panit);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class circlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = Colors.orange
      ..strokeWidth = 10;
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width * 0.9 / 2, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final panit = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final a = Offset(size.width * 1 / 4, size.height * 1 / 4);
    final b = Offset(size.width * 3 / 4, size.height * 3 / 4);
    final rect = Rect.fromPoints(a, b);
    final radius = const Radius.circular(35);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), panit);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define a paint object for styling
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill; // You can change this to stroke for outline

    canvas.drawLine(Offset(size.width * 1 / 6, size.height * 1 / 2),
        Offset(size.width * 5 / 6, size.height * 1 / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Return true if the canvas needs to be redrawn when the state changes
    return false;
  }
}

class staggeredanimation extends StatefulWidget {
  const staggeredanimation({super.key});

  @override
  State<staggeredanimation> createState() => _staggeredanimationState();
}

class _staggeredanimationState extends State<staggeredanimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animationwidth;
  late Animation<double> animationheight;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animationheight =
        Tween<double>(begin: 100, end: 300).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.1, 0.4, curve: Curves.bounceInOut),
    ));
    animationwidth = Tween<double>(begin: 100, end: 300).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 0.8, curve: Curves.bounceInOut),
      ),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            body: Center(
              child: Container(
                height: animationheight.value,
                width: animationwidth.value,
                color: Colors.blue,
              ),
            ),
          );
        });
  }
}

class loginusecustom extends StatefulWidget {
  const loginusecustom({super.key});

  @override
  State<loginusecustom> createState() => _loginusecustomState();
}

class _loginusecustomState extends State<loginusecustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 99, 135, 153),
      body: Stack(
        children: [
          ClipPath(
            clipper: topContainer(),
            child: Container(
              height: 300,
              color: const Color.fromARGB(255, 35, 53, 62),
            ),
          ),

          // ClipPath(
          //   clipper: containerclip(),
          //   child: Container(
          //     padding: const EdgeInsets.all(17),
          //     color: const Color.fromARGB(255, 10, 29, 45),
          //     //   height: 400,
          //     //     child: const Column(
          //     //       crossAxisAlignment: CrossAxisAlignment.start,
          //     //       children: [
          //     //         const Icon(
          //     //           Icons.arrow_back_ios_sharp,
          //     //           color: Colors.white54,
          //     //         ),
          //     //         const SizedBox(
          //     //           // width: 50,
          //     //           height: 10,
          //     //         ),
          //     //         Padding(
          //     //           padding: EdgeInsets.only(left: 30),
          //     //           child: Text(
          //     //             "Welcome \nBack",
          //     //             style: TextStyle(
          //     //                 color: Colors.white,
          //     //                 fontSize: 22,
          //     //                 fontWeight: FontWeight.bold,
          //     //                 letterSpacing: 02),
          //     //           ),
          //     //         )
          //     //       ],
          //     //     ),
          //     //   ),
          //     // ),
          //     // const Padding(
          //     //   padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          //     //   child: const TextField(
          //     //     decoration: const InputDecoration(
          //     //         hintText: "Email",
          //     //         hintStyle: TextStyle(color: Colors.white),
          //     //         prefixIcon: Icon(
          //     //           Icons.email,
          //     //           color: Colors.white,
          //     //         ),
          //     //         focusedBorder: UnderlineInputBorder(
          //     //           borderSide: BorderSide(color: Colors.white),
          //     //         ),
          //     //         enabledBorder: UnderlineInputBorder(
          //     //             borderSide: BorderSide(color: Colors.white)),
          //     //         disabledBorder: OutlineInputBorder(
          //     //             borderSide: BorderSide(color: Colors.white))),
          //     //   ),
          //     // ),
          //     // const Padding(
          //     //   padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          //     //   child: const TextField(
          //     //     decoration: const InputDecoration(
          //     //       hintText: "password",
          //     //       hintStyle: TextStyle(color: Colors.white),
          //     //       prefixIcon: Icon(
          //     //         Icons.email,
          //     //         color: Colors.white,
          //     //       ),
          //     //       focusedBorder: UnderlineInputBorder(
          //     //         borderSide: BorderSide(color: Colors.white),
          //     //       ),
          //     //       enabledBorder: UnderlineInputBorder(
          //     //           borderSide: BorderSide(color: Colors.white)),
          //     //     ),
          //     //   ),
          //     // ),
          //     // const Padding(
          //     //   padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          //     //   child: Text(
          //     //     "forgot new Password?",
          //     //     style: TextStyle(
          //     //       color: Colors.white,
          //     //       fontSize: 18,
          //     //     ),
          //     //   ),
          //     // ),
          //     // const Padding(
          //     //   padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          //     //   child: Row(
          //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     //     children: [
          //     //       Text(
          //     //         "Sign In?",
          //     //         style: TextStyle(
          //     //             color: Colors.white,
          //     //             fontSize: 40,
          //     //             fontWeight: FontWeight.bold),
          //     //       ),
          //     //       CircleAvatar(
          //     //         radius: 25,
          //     //         backgroundColor: const Color.fromARGB(255, 10, 29, 45),
          //     //         child: Icon(
          //     //           Icons.arrow_forward,
          //     //           color: Colors.white,
          //     //         ),
          //     //       )
          //     //     ],
          //     //   ),
          //     // ),
          //     // ClipPath(
          //     //   clipper: bottomContainer(),
          //     //   child: Container(
          //     //     height: 200,
          //     //     color: Colors.white,
          //   ),
          // )

          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: topContainer(),
              child: Container(
                height: 300, // Adjust height as needed
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class topContainer extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.5,
        size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 1, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class bottomContainer extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    // Close the path
    path.lineTo(size.width * 0.25, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.30,
        size.width * 0.5, size.height * 0.78);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class containerclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.25,
        size.width * 0.75, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.75, size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(300, 300),
          // size: MediaQuery.of(context).size,
          painter: HeartPainter(),
        ),
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Text(
                "Welcome\nBack",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // const SizedBox(height: 60),
              // TextField(
              //   decoration: InputDecoration(
              //     prefixIcon: const Icon(Icons.email, color: Colors.white),
              //     labelText: 'Email',
              //     labelStyle: const TextStyle(color: Colors.white),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white, width: 1.5),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white, width: 2.0),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20),
              // TextField(
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     prefixIcon: const Icon(Icons.lock, color: Colors.white),
              //     labelText: 'Password',
              //     labelStyle: const TextStyle(color: Colors.white),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white, width: 1.5),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white, width: 2.0),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Text(
              //     "Forgot your password?",
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              // const SizedBox(height: 40),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text(
              //       "Sign In",
              //       style: TextStyle(
              //         fontSize: 24,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white,
              //       ),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         // Handle sign-in action
              //       },
              //       style: ElevatedButton.styleFrom(
              //         shape: const CircleBorder(),
              //         padding: const EdgeInsets.all(16),
              //         backgroundColor: Colors.black,
              //       ),
              //       child: const Icon(Icons.arrow_forward, color: Colors.white),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF32436D) // Navy blue color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.35,
      size.width * 0.5,
      size.height * 0.45,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.55,
      size.width,
      size.height * 0.4,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height / 2); // Start at the center

    // Create the heart shape using various path methods
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.35,
        size.width / 2, size.height * 0.2);
    path.arcToPoint(Offset(size.width * 0.25, size.height * 0.35),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width / 2, size.height * 0.7, size.width * 0.75,
        size.height * 0.35);
    path.close(); // Close the path to create a filled shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
