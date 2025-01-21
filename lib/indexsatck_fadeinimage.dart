import 'package:flutter/material.dart';

class IndexedStackExample extends StatefulWidget {
  @override
  _IndexedStackExampleState createState() => _IndexedStackExampleState();
}

class _IndexedStackExampleState extends State<IndexedStackExample> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              Container(
                  color: Colors.red, child: Center(child: Text('Red Screen'))),
              Container(
                  color: Colors.green,
                  child: Center(child: Text('Green Screen'))),
              Container(
                  color: Colors.blue,
                  child: Center(child: Text('Blue Screen'))),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _selectedIndex = 0),
              child: Text('Red'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => setState(() => _selectedIndex = 1),
              child: Text('Green'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => setState(() => _selectedIndex = 2),
              child: Text('Blue'),
            ),
          ],
        ),
      ],
    );
  }
}

class IndexsatckFadeinimage extends StatefulWidget {
  const IndexsatckFadeinimage({super.key});

  @override
  State<IndexsatckFadeinimage> createState() => _IndexsatckFadeinimageState();
}

class _IndexsatckFadeinimageState extends State<IndexsatckFadeinimage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FadeInImage.assetNetwork(
              fadeInDuration: Duration(seconds: 2),
              placeholder: 'assets/cat.jpg',
              image:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRneF6YlKoPHrVxJAnSHV5edlYqs0FSV8rIxA&s"),
        ),
      ),
    );
  }
}
