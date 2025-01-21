import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class Zoomdrawerview extends StatefulWidget {
  const Zoomdrawerview({super.key});

  @override
  State<Zoomdrawerview> createState() => _ZoomdrawerState();
}

class _ZoomdrawerState extends State<Zoomdrawerview> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: menuScreen(
        setindex: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
      mainScreen: currentScreen(),
      borderRadius: 20,
      showShadow: true,
      angle: -2.0,
      menuBackgroundColor: Colors.deepPurple,
    );
  }

  Widget currentScreen() {
    switch (currentindex) {
      case 0:
        return HomeScreen(
          title: 'Home',
        );
      case 1:
        return HomeScreen(title: "Index");
      case 2:
        return HomeScreen(title: "Send");
      case 3:
        return HomeScreen(title: "Favourite");
      case 4:
        return HomeScreen(title: "Archive");
      case 5:
        return HomeScreen(title: "spam");
      default:
        return HomeScreen(
          title: 'home',
        );
    }
  }
}

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({
    super.key,
    required this.title,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        leading: drawerwidget(),
      ),
    );
  }
}

class menuScreen extends StatefulWidget {
  final ValueSetter setindex;
  const menuScreen({super.key, required this.setindex});

  @override
  State<menuScreen> createState() => _menuScreenState();
}

class _menuScreenState extends State<menuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 20),
          child: Column(
            children: [
              Drawerheading(Icons.home_outlined, "Home", 0),
              Drawerheading(Icons.email_outlined, "inbox", 1),
              Drawerheading(Icons.send_outlined, "send ", 2),
              Drawerheading(Icons.favorite_outline, "Favorite", 3),
              Drawerheading(Icons.archive_outlined, "Archive", 4),
              Drawerheading(Icons.spa_outlined, "Spam", 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget Drawerheading(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        log("message");
        log("Tapped on: $text, index: $index");
        widget.setindex(index);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

class drawerwidget extends StatelessWidget {
  const drawerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: Icon(Icons.menu),
    );
  }
}

class ClipPathExample extends StatelessWidget {
  final _controller = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _controller,
      child: Scaffold(
        appBar: AppBar(title: Text("ClipPath Example")),
        body: Column(
          children: [
            // ClipPath(
            //   clipper: WaveClipper(),
            //   child: Container(
            //     height: 200,
            //     color: Colors.blue,
            //     child: Center(
            //       child: Text(
            //         "Wave Shape",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            buildImages(),
            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
                onPressed: () async {
                  final image = await _controller.capture().then(
                    (bytes) {
                      if (bytes != null) {
                        log("Captured image bytes: ${bytes.length}"); // Add a log for the captured bytes
                        //  SaveImage(bytes);
                        SaveandSahreimage(bytes);
                      } else {
                        log("No image captured");
                      }
                    },
                  ).catchError((onError) {
                    log(onError);
                  });
                  log("message");
                },
                child: Text("Capture Image")),
            ElevatedButton(
                onPressed: () async {
                  final image =
                      await _controller.captureFromWidget(buildImages()).then(
                    (bytes) {
                      if (bytes != null) {
                        log("Captured image bytes: ${bytes.length}"); // Add a log for the captured bytes
                        //  SaveImage(bytes);
                        SaveandSahreimage(bytes);
                      } else {
                        log("No image captured");
                      }
                    },
                  ).catchError((onError) {
                    log(onError);
                  });
                  log("message");
                },
                child: Text("Capture from widget")),
          ],
        ),
      ),
    );
  }

//   Future<void> SaveImage(Uint8List bytes) async {
//     final name = "Screenshot";
//     var status = await Permission.storage.request();
//     if (status.isGranted) {
//       final result = await ImageGallerySaver.saveImage(bytes, name: name);
//       log("result : $result");
//       log("message1");
//       return result['filepath'];
//     } else {
//       log("Permission denied.");
//     }
//   }
// }

  Future<void> SaveandSahreimage(Uint8List bytes) async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    final image = File('${directory!.path}.png');
    image.writeAsBytes(bytes);
    await Share.shareXFiles([XFile(image.path)]);
  }

  Widget buildImages() => SizedBox(
        height: 200,
        child: Image(
            height: 190,
            width: 260,
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrTFrhr_-pYR74jUgOy7IerAoHAX3zPIZZcg&s")),
      );
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50); // Start from the bottom-left
    path.quadraticBezierTo(
      size.width / 4, size.height, // Control point
      size.width / 2, size.height - 50, // Endpoint of the curve
    );
    path.quadraticBezierTo(
      3 * size.width / 4, size.height - 100, // Control point
      size.width, size.height - 50, // Endpoint of the curve
    );
    path.lineTo(size.width, 0); // Top-right
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
