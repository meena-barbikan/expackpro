// image gallery saver run agala



// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';

// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// // ignore: depend_on_referenced_packages
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class MemeGenerate extends StatefulWidget {
//   const MemeGenerate({super.key});

//   @override
//   State<MemeGenerate> createState() => _MemeGenerateState();
// }

// class _MemeGenerateState extends State<MemeGenerate> {
//   final GlobalKey globalKey = GlobalKey();
//   bool imageselected = false;
//   String headerText = "";
//   String footerText = "";

//   File? _image; // image select pana
//   File? _imagefile; // save pana image display pana

//   Random rng = Random();

//   Future getimage() async {
//     var image;
//     try {
//       image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     } catch (e) {
//       print("not allowing $e");
//     }
//     setState(() {
//       if (image != null) {
//         imageselected = true;
//       } else {
//         imageselected = false;
//       }
//       _image = image;
//     });
//     new Directory("storage/emulated/0/" + 'MemeGenerator')
//         .create(recursive: true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           getimage();
//         },
//         child: const Icon(Icons.camera_outdoor),
//       ),
//       body: Column(
//         children: [
//           const Center(
//             child: Image(
//                 alignment: Alignment.center,
//                 height: 80,
//                 image: NetworkImage(
//                     "data:image/jpeg;base64,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")),
//           ),
//           const Text(
//             "Meme",
//             style: TextStyle(
//                 color: Colors.blue, fontSize: 40, fontWeight: FontWeight.bold),
//           ),
//           const Text(
//             "Generator",
//             style: TextStyle(
//                 color: Colors.blue, fontSize: 40, fontWeight: FontWeight.bold),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: RepaintBoundary(
//               key: globalKey,
//               child: Stack(
//                 children: [
//                   _image != null
//                       ? Image.file(
//                           _image!,
//                           height: 300,
//                         )
//                       : Container(),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     child: Column(
//                       children: [Text(headerText), Spacer(), Text(footerText)],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           imageselected == true
//               ? Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     children: [
//                       TextField(
//                         decoration:
//                             const InputDecoration(hintText: "HeaderText"),
//                         onChanged: (value) {
//                           setState(() {
//                             headerText = value;
//                           });
//                         },
//                       ),
//                       TextField(
//                         decoration:
//                             const InputDecoration(hintText: "FotterText"),
//                         onChanged: (value) {
//                           setState(() {
//                             footerText = value;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//               : Container(),
//           imageselected == false ? Text("Select Your Image") : Container(),
//           TextButton(
//               onPressed: () {
//                 takescreenshot();
//               },
//               child: const Text("Save"))
//         ],
//       ),
//     );
//   }

//   takescreenshot() async {
//     RenderRepaintBoundary boundary =
//         globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//     ui.Image image = await boundary.toImage();
//     final directory = (await getApplicationDocumentsDirectory()).path;
//     ByteData? byteData =
//         await (image.toByteData(format: ui.ImageByteFormat.png));
//     Uint8List pngdata = byteData!.buffer.asUint8List();
//     print(pngdata);
//     File imgFile = new File("$directory/screenshot${rng.nextInt(200)}.png");
//     setState(() {
//       _imagefile = imgFile;
//     });
//     save(_imagefile!);
//     imgFile.writeAsBytes(pngdata);
//   }

//   save(File file) async {
//     await _askPermission();
//     final result = await ImageGallerySaver.saveImage(
//         Uint8List.fromList(await file.readAsBytes()));
//     print(result);
//   }

//   _askPermission() async {
//     PermissionStatus permissions = await Permission.photos.request();
//   }
// }
