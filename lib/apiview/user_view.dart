import 'package:expackpro/apiview/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../indexsatck_fadeinimage.dart';
import 'local_dp_service.dart';
import 'resigster.dart';
import 'user_model.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isvisible = true;
  String? token;
  String? id;
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
      id = await LocalDpService().getId();
      UserModel model = UserModel(email: email.text, password: password.text);
      var response = await LoginService()
          .loginApi(model: model, token: token)
          .then((value) async {
        await LocalDpService()
            .setLogin(
          // email: email.text,
          // password: password.text,
          token: token.toString(),
        )
            .then((onvalue) {
          while (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => IndexsatckFadeinimage()));
        });
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resigster Screen"),
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
                child: Text("Submit")),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Resigster()));
                  },
                  child: Text("Register Create an Account ?")),
            )
          ],
        ),
      ),
    );
  }
}
