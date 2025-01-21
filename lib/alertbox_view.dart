import 'package:flutter/material.dart';

class AlertboxView extends StatefulWidget {
  const AlertboxView({super.key});

  @override
  State<AlertboxView> createState() => _AlertboxViewState();
}

class _AlertboxViewState extends State<AlertboxView> {
  bool ischecked = false;
  bool issecond = false;
  bool isthird = false;

  String? _selectedFruit = 'Apple';
  void alertboxview(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alertbox"),
            content: SizedBox(
              height: 100,
              width: 200,
              child: Column(
                children: [Text("AlertboxContent")],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              )
            ],
          );
        });
  }

  String? fruit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alertbox"),
      ),
      body: ListView(
        children: [
          TextButton(
              onPressed: () {
                alertboxview(context);
              },
              child: Text("AlertBox")),
          ListTile(
            title: Text("text3"),
            leading: Checkbox(
              value: ischecked,
              onChanged: (bool? value) {
                setState(() {
                  ischecked = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Text2"),
            leading: Checkbox(
              value: issecond,
              onChanged: (bool? value) {
                setState(() {
                  issecond = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Text 1"),
            leading: Checkbox(
              value: isthird,
              onChanged: (bool? value) {
                setState(() {
                  isthird = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Apple"),
            leading: Radio(
                value: "Apple",
                groupValue: _selectedFruit,
                onChanged: (String? value) {
                  setState(() {
                    _selectedFruit = value;
                  });
                }),
          ),
          ListTile(
            title: Text("BANNA"),
            leading: Radio(
                value: "Banna",
                groupValue: _selectedFruit,
                onChanged: (String? value) {
                  setState(() {
                    _selectedFruit = value;
                  });
                }),
          ),
          ListTile(
            title: Text("Apple2"),
            leading: Radio(
                value: "Apple2",
                groupValue: _selectedFruit,
                onChanged: (String? value) {
                  setState(() {
                    _selectedFruit = value;
                  });
                }),
          ),
          DropdownButtonFormField(
              value: fruit,
              items: const [
                DropdownMenuItem(
                  child: Text("Apple"),
                  value: "apple",
                ),
                DropdownMenuItem(
                  child: Text("Banana"),
                  value: "banana",
                ),
                DropdownMenuItem(
                  child: Text("Jerry"),
                  value: "jerry",
                ),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Fruit',
                hintText: 'Choose a fruit',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a fruit';
                }
                return null;
              },
              onChanged: (String? value) {
                setState(() {
                  fruit = value;
                });
              })
        ],
      ),
    );
  }
}
