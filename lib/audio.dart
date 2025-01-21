import 'dart:io';

import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

class Audio extends StatefulWidget {
  const Audio({super.key});

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final player = AudioPlayer();

  // ignore: non_constant_identifier_names
  Future<void> PlayAudioFormUrl(String url) async {
    await player.play(UrlSource(url));
  }

  // final SignatureController _controller = SignatureController(
  //   penStrokeWidth: 5,
  //   penColor: Colors.red,
  //   exportBackgroundColor: Colors.blue,
  // );
  double height = 150;
  double width = 150;

  // ignore: non_constant_identifier_names
  void RaisedButton() {
    setState(() {
      width = 300;
      height = 300;
    });
  }

  final Tween<double> _scaletween = Tween<double>(begin: 1, end: 2);

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

    requesPermission() async {
      final status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }
    }

    Future<void> saveSignature() async {
      try {
        await requesPermission();

        ui.Image image = await _signaturePadKey.currentState!.toImage();
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List uint8List = byteData!.buffer.asUint8List();

        // Get the application's documents directory
        // Directory directory = await getApplicationDocumentsDirectory();
        // String path = "${directory.path}/signature.png";

        File file = File('storage/emulated/0/Download/signatue.png');
        await file.writeAsBytes(uint8List);

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signature saved at $file")),
        );
      } catch (e) {
        // Handle errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to save signature: $e")),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    PlayAudioFormUrl(
                        "http://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/theme_01.mp3");
                  },
                  child: const Text("Play Audio"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    player.stop();
                  },
                  child: const Text("Stop Audio")),
              SizedBox(
                height: 200,
                width: 300,
                child: SfSignaturePad(
                  key: _signaturePadKey,
                  minimumStrokeWidth: 1,
                  maximumStrokeWidth: 3,
                  strokeColor: Colors.blue,
                  backgroundColor: Colors.grey,
                ),
              ),

              TextButton(
                  onPressed: () {
                    saveSignature();
                  },
                  child: const Text("SaVe")),
              TextButton(
                  onPressed: () {
                    RaisedButton();
                  },
                  child: const Text("Animation")),
              // AnimatedContainer(
              //   width: width,
              //   height: height,
              //   decoration: const BoxDecoration(color: Colors.amber),
              //   duration: Duration(milliseconds: 900),
              //   curve: Curves.bounceOut,
              //   child: const Center(
              //     child: Text(
              //       "Animation",
              //       style: TextStyle(fontSize: 18),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // TweenAnimationBuilder(
              //   tween: _scaletween,
              //   duration: Duration(milliseconds: 300),
              //   builder: (BuildContext context, scale, child) {
              //     return Transform.scale(
              //       scale: scale,
              //       child: child,
              //     );
              //   },
              //   child: Container(
              //     width: width,
              //     height: height,
              //     decoration: const BoxDecoration(color: Colors.amber),
              //     child: const Center(
              //       child: Text(
              //         "Animation",
              //         style: TextStyle(fontSize: 18),
              //       ),
              //     ),
              //   ),
              // ),
              // AnimatedBuilder(
              //   animation: _controller.view,
              //   builder: (BuildContext context, child) {
              //     return Transform.rotate(
              //       angle: _controller.value * 2 * pi,
              //       child: child,
              //     );
              //   },
              //   child: Container(
              //     width: width,
              //     height: height,
              //     decoration: const BoxDecoration(color: Colors.amber),
              //     child: const Center(
              //       child: Text(
              //         "Animation",
              //         style: TextStyle(fontSize: 18),
              //       ),
              //     ),
              //   ),
              // ),

              ElevatedButton(
                onPressed: () async {
                  // Share text with a URL
                  final result = await Share.share(
                    "Check out my website: https://example.com",
                  );
                  print(result);
                },
                child: const Text("Share Text"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final ImagePicker imagePicker = ImagePicker();
                    final XFile? image = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (image != null) {
                      try {
                        await Share.shareXFiles([XFile(image.path)]);
                      } catch (e) {
                        print("Error sharing file: $e");
                      }
                    }
                  },
                  child: const Text("Share Files")),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Normal toast Msg")));
                },
                child: const Text("Normal Toast Msg"),
              ),
              ElevatedButton(
                  onPressed: () {
                    DelightToastBar(
                            builder: (context) {
                              return ToastCard(
                                title: const Text("Delight Toast Card"),
                                shadowColor: Colors.grey[300],
                                leading: const Icon(Icons.width_normal),
                              );
                            },
                            position: DelightSnackbarPosition.top)
                        .show(context);
                  },
                  child: const Text("Delight Toast Msg ")),
            ],
          ),
        ),
      ),
    );
  }
}
