import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class Authenticationview extends StatefulWidget {
  const Authenticationview({super.key});

  @override
  State<Authenticationview> createState() => _AuthenticationviewState();
}

class _AuthenticationviewState extends State<Authenticationview> {
  bool isShow = false;
  final LocalAuthentication auth = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (!isShow) {
              final bool localAuthentication = await auth.canCheckBiometrics;
              if (localAuthentication) {
                try {
                  final bool didAuthenticate = await auth.authenticate(
                    localizedReason:
                        "Please authenticate to show account balance",
                    options: AuthenticationOptions(biometricOnly: false),
                  );
                  setState(() {
                    isShow = didAuthenticate;
                  });
                } catch (e) {
                  log(e.toString());
                }
              }
              //
            } else {
              setState(() {
                isShow = false;
              });
            }
          },
          child: Icon(isShow ? Icons.lock : Icons.lock_open)),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    const Text(
                      "Account Balance",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    if (isShow)
                      const Text(
                        "Rs. 2345",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    if (!isShow)
                      const Text(
                        "*******",
                        style: TextStyle(color: Colors.grey, fontSize: 26),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
