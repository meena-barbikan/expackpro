import 'dart:developer';

import 'package:expackpro/sqlite/user_model.dart';
import 'package:expackpro/sqlite/user_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class UserCreatesqliteView extends StatefulWidget {
  UserModel? usermodel;
  UserCreatesqliteView({super.key, this.usermodel});

  @override
  State<UserCreatesqliteView> createState() => _UserCreatesqliteViewState();
}

class _UserCreatesqliteViewState extends State<UserCreatesqliteView> {
  TextEditingController username = TextEditingController();
  TextEditingController Password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future submitEvent() async {
    try {
      if (formKey.currentState!.validate()) {
        String userid = "";
        int id = -1;
        if (widget.usermodel != null) {
          userid = widget.usermodel?.userid ?? "";
          id = widget.usermodel?.id ?? -1;
        } else {
          userid = generateEncryptionValue("user");
        }
        //loading
        CircularProgressIndicator();
        //model
        UserModel model = UserModel();
        model.id = id;
        model.userid = userid;
        model.password = Password.text;
        model.name = username.text;
        if (widget.usermodel != null) {
          await UserService().updateUser(model: model).then((onValue) {
            //Navigator.pop(context);
            Navigator.pop(context, true);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("User Update Successfully")));
          });
        } else {
          await UserService().insertUser(model: model).then((onValue) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("User Create Successfully")));
          });
        }
      }
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future deleteItem(int id) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Warning"),
            content: Text("Do you Want to delete this User?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("Ok"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ],
          );
        }).then((onValue) async {
      if (onValue != null) {
        try {
          // loding
          //model
          UserModel model = UserModel();
          return await UserService().deleteUser(id: id).then((onValue) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("User deleted Successfully")));
          });
        } catch (e) {
          log(e.toString());
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    });
  }

  @override
  void initState() {
    if (widget.usermodel != null) {
      username.text = widget.usermodel?.name.toString() ?? "";
      Password.text = widget.usermodel?.password.toString() ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Create Page"),
        actions: [
          IconButton(
              onPressed: () {
                deleteItem(widget.usermodel?.id ?? -1);
              },
              icon: Icon(Icons.delete))
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          submitEvent();
        },
        child: BottomAppBar(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Submit",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey, // Connect the form key here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter the username";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "userName",
                    //  labelText: "flutter,",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: Password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "passWord",
                    //contentPadding: const EdgeInsets.all(10),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String generateEncryptionValue(String text) {
  // Get current time
  DateTime now = DateTime.now();

  // Concatenate text with current time in milliseconds
  String dataToEncrypt = text + now.millisecondsSinceEpoch.toString();

  // Generate a SHA-256 hash of the concatenated string
  var bytes = utf8.encode(dataToEncrypt);
  var digest = sha256.convert(bytes);

  return digest.toString(); // This will return the encrypted value as a string
}
