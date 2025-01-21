import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Curvednavigationbarviewexample extends StatefulWidget {
  const Curvednavigationbarviewexample({super.key});

  @override
  State<Curvednavigationbarviewexample> createState() =>
      _CurvednavigationbarviewexampleState();
}

class _CurvednavigationbarviewexampleState
    extends State<Curvednavigationbarviewexample> {
  final items = <Widget>[
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.favorite),
    Icon(Icons.person),
    Icon(Icons.settings)
  ];

  final pages = [
    homepageview(),
    searchpage(),
    favouritepage(),
    personviewpage(),
    settingsviewpage(),
  ];
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        title: const Text("CurvedNavigation Bar"),
      ),
      body: pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        buttonBackgroundColor: Colors.amber,
        index: index,
        backgroundColor: Colors.transparent,
        color: Colors.black,
        onTap: (Value) {
          setState(
            () => index = Value,
          );
        },
        animationCurve: Curves.easeOutQuad,
      ),
    );
  }
}

class homepageview extends StatefulWidget {
  const homepageview({super.key});

  @override
  State<homepageview> createState() => _homepageviewState();
}

class _homepageviewState extends State<homepageview> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

class settingsviewpage extends StatefulWidget {
  const settingsviewpage({super.key});

  @override
  State<settingsviewpage> createState() => _settingsviewpageState();
}

class _settingsviewpageState extends State<settingsviewpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Settings",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

class favouritepage extends StatefulWidget {
  const favouritepage({super.key});

  @override
  State<favouritepage> createState() => _favouritepageState();
}

class _favouritepageState extends State<favouritepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Favourite",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Search",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

class personviewpage extends StatefulWidget {
  const personviewpage({super.key});

  @override
  State<personviewpage> createState() => _personviewpageState();
}

class _personviewpageState extends State<personviewpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "person",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
