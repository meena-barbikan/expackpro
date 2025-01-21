import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColumView extends StatefulWidget {
  const ColumView({super.key});

  @override
  State<ColumView> createState() => _ColumViewState();
}

class _ColumViewState extends State<ColumView> {
  var formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController flutter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Validate the form
          if (formkey.currentState!.validate()) {
            // All validations passed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login successfully"),
              ),
            );
          } else {
            // Validation failed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Please correct the errors."),
              ),
            );
          }
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
            key: formkey, // Connect the form key here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: "Username",
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.amber)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.amber)),
                  ),
                ),
                // Card(
                //   elevation: 4,
                //   //color: Colors.black,
                //   // shape: RoundedRectangleBorder(
                //   //   borderRadius: BorderRadius.circular(15),
                //   //   // Rounded corners
                //   // ),
                //   child: Text("flutter  gybgyggygy"),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Row(
                //   children: [
                //     Text("Fluter"),
                //     Text("fLUTTER 1"),
                //     Spacer(),
                //     Text("Flutter 3"),
                //   ],
                // ),
                // Flex(
                //   direction: Axis.horizontal,
                //   children: [
                //     Container(
                //       height: 50,
                //       width: 50,
                //       color: Colors.green,
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Container(
                //       height: 50,
                //       width: 50,
                //       color: Colors.green,
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Container(
                //       height: 50,
                //       width: 50,
                //       color: Colors.green,
                //     ),
                //   ],
                // ),
                // Container(
                //   color: Colors.amber,
                //   height: 80,
                //   width: 80,
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     color: Colors.amber,
                //     height: 80,
                //     width: 80,
                //   ),
                // ),

                //Align(alignment: Alignment.centerLeft, child: Text("FlutteR")),

                TextFormField(
                  controller: flutter,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please crt the error";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "flutter,",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
