import 'package:flutter/material.dart';

class Listviewexample extends StatefulWidget {
  const Listviewexample({super.key});

  @override
  State<Listviewexample> createState() => _ListviewexampleState();
}

class _ListviewexampleState extends State<Listviewexample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Builder Example"),
      ),
      body: ListView(
        children: [
          ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GridViewBuilder()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("${index++}"),
                  ),
                );
              })
        ],
      ),
    );
  }
}

class GridViewBuilder extends StatefulWidget {
  const GridViewBuilder({super.key});

  @override
  State<GridViewBuilder> createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GRIDVIEWBUilder"),
      ),
      body: ListView(
        children: [
          GridView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 0.3),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Stackexample()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(13)),
                    child: Text(
                      "${index++}",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

class Stackexample extends StatefulWidget {
  const Stackexample({super.key});

  @override
  State<Stackexample> createState() => _StackexampleState();
}

class _StackexampleState extends State<Stackexample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StackExample"),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                decoration: const BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "Flutter Stack",
                ),
              ),
              Positioned(
                  left: 50,
                  top: 00,
                  child: Container(
                    height: 20,
                    width: 60,
                    padding: const EdgeInsets.all(01),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(02),
                          bottomLeft: Radius.circular(10)),
                    ),
                    child: const Text("Positioned"),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
