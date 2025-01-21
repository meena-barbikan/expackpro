import 'package:expackpro/apiview/user_model.dart';
import 'package:expackpro/apiview/user_service.dart';
import 'package:expackpro/apiview/user_view.dart';
import 'package:expackpro/simpledesign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'local_dp_service.dart';

class Resigster extends StatefulWidget {
  const Resigster({super.key});

  @override
  State<Resigster> createState() => _ResigsterState();
}

class _ResigsterState extends State<Resigster> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isvisible = true;
  String? token;
  var formKey = GlobalKey<FormState>();
  Future Submitevent() async {
    try {
      // loading
      const CircularProgressIndicator(
        value: 2,
        color: Colors.white,
      );
      // model
      token = await LocalDpService().gettoken();
      UserModel model = UserModel(email: email.text, password: password.text);
      var response = await UserService().authApi(model: model, token: token);
      Navigator.pop(context);
      if (response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registration SuccessFully")));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const UserView()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Registration Failed")));
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resigster Screen"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextFormField(
                controller: password,
                obscureText: isvisible,
                decoration: InputDecoration(
                  hintText: "password",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      icon: Icon(isvisible
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Submitevent();
                },
                child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}
