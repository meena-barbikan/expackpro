import 'package:expackpro/hive/hive_model.dart';
import 'package:expackpro/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveListView extends StatefulWidget {
  const HiveListView({super.key});

  @override
  State<HiveListView> createState() => _HiveListState();
}

class _HiveListState extends State<HiveListView> {
  List<HiveModel> modellist = [];
  TextEditingController name = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  showdialogContent(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Add User",
              style: TextStyle(color: Colors.amber),
            ),
            content: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter The name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: id,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please crt the password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Id",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: phonenumber,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please crt the phonenumber";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      hintText: "PhoneNumber",
                      fillColor: Colors.grey.shade100,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // final addusers = HiveModel(
                  //     id: id.text,
                  //     name: name.text,
                  //     phonenumber: phonenumber.text);
                  // final userbox = Hive.box<HiveModel>("users");
                  // userbox.add(addusers);
                },
                child: const Text("Ok"),
              ),
              const Text("Close")
            ],
          );
        });
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("HiveListView"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showdialogContent(context);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      child: Text("${index + 1}"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("name  : ${name}"),
                        Text("Phonenumber   ")
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
