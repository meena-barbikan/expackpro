import 'package:expackpro/responsive/details_page.dart';
import 'package:expackpro/responsive/states.dart';
import 'package:flutter/material.dart';

class Appdrawer extends StatefulWidget {
  const Appdrawer({super.key});

  @override
  State<Appdrawer> createState() => _AppdrawerState();
}

class _AppdrawerState extends State<Appdrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: aLLStates.length + 1,
        itemBuilder: (context, index) {
          return index == 0 ? buildDrawer() : BuildMenuitem(index);
        });
  }
}

Widget buildDrawer() => DrawerHeader(
        child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGNPEcxhRePPkF3zLj1c2Z67EItsM4u03MA&s"),
        ),
      ),
    ));

Widget BuildMenuitem(int index) => ListTile(
      leading: const Icon(Icons.local_activity),
      title: Text(
        aLLStates[index - 1],
        style: TextStyle(color: Colors.grey.shade900),
      ),
    );
