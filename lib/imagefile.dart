import 'dart:io';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  File? imageFile;
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      File? croppedFile = await _cropImage(pickedFile.path);
      if (croppedFile != null) {
        setState(() {
          imageFile = croppedFile;
        });
      }
    }
  }

  // Crop the selected image
  Future<File?> _cropImage(String filePath) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath,
      // aspectRatioPresets: [
      //   CropAspectRatioPreset.square,
      //   CropAspectRatioPreset.ratio3x2,
      //   CropAspectRatioPreset.original,
      //   CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio16x9,
      //
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        )
      ],
    );
    return croppedFile != null ? File(croppedFile.path) : null;
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select & Crop Image'),
      ),
      bottomNavigationBar: SpinCircleBottomBar(
          bottomNavigationBar: SCBottomBarDetails(
        items: [
          SCBottomBarItem(
            icon: Icons.home,
            onPressed: () {},
          ),
          SCBottomBarItem(icon: Icons.home, onPressed: () {}, title: "home"),
          SCBottomBarItem(icon: Icons.home, onPressed: () {}, title: "home"),
          SCBottomBarItem(icon: Icons.home, onPressed: () {}, title: "home"),
        ],
        circleItems: [
          SCItem(
            icon: Icon(Icons.add),
            onPressed: () {
              print('Circle item clicked');
            },
          ),
        ],

        bnbHeight: 80,

        /// Color of the circle icon
        backgroundColor: Colors.blue, // Background color of the bottom bar
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextPage()),
                  );
                  checkpermission(Permission.location, context);
                },
                child: const Text("Check Permission")),
          ),
          imageFile != null
              ? Image.file(
                  imageFile!,
                  height: 200,
                  width: 200,
                  color: Colors.amberAccent,
                )
              : const Text('No Image Selected'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: const Text('Pick Image from Gallery'),
          ),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: const Text('Capture Image with Camera'),
          ),
          const Text("SStudent Details"),
          ExpansionTileCard(
            leading: const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkAhvc-YjdwsimlEYdOknxcvbgNOVSHWjkWQ&s"),
            ),
            title: const Text(
              "StudentName",
            ),
            subtitle: const Text("234678"),
            borderRadius: BorderRadius.circular(15),

            elevation: 5, // Adds shadow and depth
            initialElevation: 2, // Elevation when collapsed
            shadowColor: Colors.grey, // Shadow color during animation
            onExpansionChanged: (isExpanded) {
              // Optional callback for when the tile expands or collapses
              if (isExpanded) {
                _controller.forward();
                print("Expanded!");
              } else {
                _controller.reverse();
              }
            },
            children: [
              SizeTransition(
                sizeFactor: _animation,
                axis: Axis.vertical,
                axisAlignment: -1.0,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.bloodtype,
                            color: Colors.red,
                          ),
                          Text("AB +"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.blue,
                          ),
                          Text("+ 91 1234556677"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_home_rounded,
                            color: Colors.green,
                          ),
                          Text("4 street, vnr , 626 001"),
                        ],
                      ),
                    ),
                    ButtonBar(
                      children: [Icon(Icons.restore_rounded)],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> checkpermission(
      Permission permission, BuildContext context) async {
    final status = await permission.request();

    if (status.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Permission Is Granted")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Permission Is  Not Granted")));
    }
  }
  // getfromGallery(context) async {
  //   XFile? pickedFile = await ImagePicker().pickImage(
  //       source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);
  // }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Page')),
      body: Center(
        child:
            const Text('You have granted the permission and navigated here!'),
      ),
    );
  }
}
