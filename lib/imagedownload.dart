// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_downloader/image_downloader.dart';

// class ImagedownloadView extends StatefulWidget {
//   const ImagedownloadView({super.key});

//   @override
//   State<ImagedownloadView> createState() => _ImagedownloadState();
// }

// class _ImagedownloadState extends State<ImagedownloadView> {
//   String imageurl =
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGNL2TOSy-A3y2rU54UWFfzn4mtvp55KdGnw&s";
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.all(10),
//               width: double.infinity,
//               height: 300,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       fit: BoxFit.cover, image: NetworkImage(imageurl)),
//                   borderRadius: BorderRadius.circular(10)),
//             ),
//             GestureDetector(
//               onTap: () {
//                 downloadImage(imageurl);
//               },
//               child: Container(
//                 alignment: Alignment.center,
//                 margin: const EdgeInsets.only(top: 10),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 width: 200,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: const Text(
//                   "Download Image",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   downloadImage(String imageurl) async {
//     try {
//       // Saved with this method.
//       var imageId = await ImageDownloader.downloadImage(imageurl);
//       if (imageId == null) {
//         return;
//       }
//       final snackBar = SnackBar(
//         duration: const Duration(seconds: 10),
//         content: const Text("Image Downloaded Successfully !"),
//         action: SnackBarAction(
//             label: "open",
//             onPressed: () async {
//               var path = await ImageDownloader.findPath(imageId);
//               await ImageDownloader.open(path!);
//             }),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);

//       // // Below is a method of obtaining saved image information.
//       // var fileName = await ImageDownloader.findName(imageId);
//       // var path = await ImageDownloader.findPath(imageId);
//       // var size = await ImageDownloader.findByteSize(imageId);
//       // var mimeType = await ImageDownloader.findMimeType(imageId);
//     } on PlatformException catch (error) {
//       print(error);
//     }
//   }
// }

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageDownloadview extends StatefulWidget {
  const ImageDownloadview({super.key});

  @override
  State<ImageDownloadview> createState() => _ImageDownloadviewState();
}

class _ImageDownloadviewState extends State<ImageDownloadview> {
  String imageurl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGNL2TOSy-A3y2rU54UWFfzn4mtvp55KdGnw&s";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageurl)),
                  borderRadius: BorderRadius.circular(10)),
            ),
            GestureDetector(
              onTap: () async {},
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Download Image",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class galleryimage extends StatefulWidget {
  const galleryimage({super.key});

  @override
  State<galleryimage> createState() => _galleryimageState();
}

class _galleryimageState extends State<galleryimage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class MyHomePageview extends StatelessWidget {
  const MyHomePageview({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('iOS Style App'),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CupertinoButton.filled(
              child: const Text('Click Me'),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Hello'),
                    content: const Text('This is an iOS-style dialog.'),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('OK'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "data",
              style: TextStyle(color: CupertinoColors.white),
            ),
            const Text(
              "This is body content",
              style: TextStyle(color: CupertinoColors.white),
            ),
            Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: CupertinoColors.activeBlue,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Text(
                "Container",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyAppios extends StatelessWidget {
  const MyAppios({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isIOS = Platform.isIOS;

    return isIOS
        ? CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('iOS Style App'),
            ),
            child: Center(
              child: CupertinoButton.filled(
                child: const Text('Click Me'),
                onPressed: () => _showDialog(context, isIOS),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(title: const Text('Android Style App')),
            body: Center(
              child: ElevatedButton(
                onPressed: () => _showDialog(context, isIOS),
                child: const Text('Click Me'),
              ),
            ),
          );
  }

  void _showDialog(BuildContext context, bool isIOS) {
    if (isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Hello'),
          content: const Text('This is an iOS-style dialog.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      Navigator.push(
          context,
          CupertinoDialogRoute(
              builder: (context) => AlertDialog(
                    title: const Text('Hello'),
                    content: const Text('This is an Android -style dialog.'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
              context: context));
    }
  }
}

// class DownloadImageWidget extends StatelessWidget {
//   // Sample image URL (you can use any image source)
//   final String imageUrl = "https://example.com/sample-image.jpg";

//   // Function to download the image and save it to the gallery
//   Future<void> _downloadImage() async {
//     // Request permission for storage access
//     var status = await Permission.storage.request();
//     if (status.isGranted) {
//       // Example image data - You'd use the image file data in actual usage
//       // This is just an example; you'll need to get the image data from the network or your local file
//       final result = await ImageGallerySaver.saveFile(imageUrl);

//       // Show success message
//       print("Image saved to gallery: $result");
//     } else {
//       print("Permission denied");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, right: 10),
//       child: SizedBox(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: _downloadImage, // Trigger the download image method on tap
//               child: const SizedBox(
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Color.fromARGB(255, 245, 161, 189),
//                       radius: 20,
//                       child: Icon(
//                         Icons.file_download_outlined,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     Text("Download")
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
