import 'dart:math';
import 'package:flutter/material.dart';

class Colorchange extends StatefulWidget {
  const Colorchange({super.key});

  @override
  State<Colorchange> createState() => _ColorchangeState();
}

class _ColorchangeState extends State<Colorchange> {
  Color backgroundColor = Colors.white;

  void colorchange() {
    setState(() {
      // Generate a random color in ARGB format
      backgroundColor = Color(0xFF000000 + Random().nextInt(0x00FFFFFF));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Colors Change"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: colorchange,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Tap Anywhere!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageColorChange extends StatefulWidget {
  const ImageColorChange({super.key});

  @override
  State<ImageColorChange> createState() => _ImageColorChangeState();
}

class _ImageColorChangeState extends State<ImageColorChange> {
  Color imageColor = Colors.white; // Default color

  // List of colors to display
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.pink,
  ];

  void changeColor(Color selectedColor) {
    setState(() {
      imageColor = selectedColor; // Update the image color
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Color Change"),
      ),
      body: Column(
        children: [
          // First Part: Image with Color Overlay
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.white, // Background for the image
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  imageColor,
                  BlendMode.modulate, // Apply color to the image
                ),
                child: Image.asset(
                  'assets/imageview.png', // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Second Part: Color Buttons
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Number of colors per row
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => changeColor(colors[index]),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors[index],
                        shape: BoxShape.circle, // Circular color buttons
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageDesignPage extends StatefulWidget {
  const ImageDesignPage({super.key});

  @override
  State<ImageDesignPage> createState() => _ImageDesignPageState();
}

class _ImageDesignPageState extends State<ImageDesignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Design'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Top part with the image
          Container(
            height: 300, // Adjust the height of the image container
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.dribbble.com/userupload/10324677/file/original-a2196486f2b0c3d94363c8d715f534be.png?resize=1200x900&vertical=center'),
                fit: BoxFit.cover, // Keeps the image aspect ratio intact
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          SizedBox(height: 20), // Space between image and color options

          // Color options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                colorOption(Colors.red),
                colorOption(Colors.blue),
                colorOption(Colors.green),
                colorOption(Colors.orange),
              ],
            ),
          ),
          SizedBox(height: 20), // Space between color options and text

          // Text or other UI elements
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose a Color:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Pick a color to apply to your design. Each color will give a unique look.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget colorOption(Color color) {
    return GestureDetector(
      onTap: () {
        // Handle the color selection action (optional)
        print('Color selected: $color');
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
