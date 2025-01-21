import 'package:flutter/material.dart';

class FlexView extends StatefulWidget {
  const FlexView({super.key});

  @override
  State<FlexView> createState() => _FlexViewState();
}

class _FlexViewState extends State<FlexView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex Example"),
      ),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical, // Vertical alignment
          children: [
            Expanded(
              flex: 2, // Takes 2x the space
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "2x Space",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1, // Takes 1x the space
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    "1x Space",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3, // Takes 3x the space
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    "3x Space",
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
