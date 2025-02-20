import 'dart:developer';

import 'package:expackpro/apipage/api_model.dart';
import 'package:expackpro/apipage/api_service.dart';
import 'package:flutter/material.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  Future? futurehandler;
  List<ApiModel> userlist = [];
  Future getinitdata() async {
    log("message");
    setState(() {
      userlist.clear();
    });
    //loading
    //CircularProgressIndicator();
    // model
    ApiModel model = ApiModel();
    log("message1");
    // Service
    // var result = await ApiService().authApi();
    // log("message2");
    // if (result != null) {
    //   for (var element in result) {
    //     log("message3");
    //     var response = ApiModel.fromMap(element);
    //     userlist.add(response);
    //   }
    //   log(" userlist : ${userlist.length.toString()}");
    //   return userlist;
    // }
    await ApiService().authApi().then((onValue) {
      for (var element in onValue) {
        var result = ApiModel.fromMap(element);
        userlist.add(result);
      }
    });
    return userlist;
  }

  @override
  void initState() {
    futurehandler = getinitdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Api Page",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: FutureBuilder(
          future: futurehandler,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No data available"));
            }

            return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: userlist.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID   : ${userlist[index].id}"),
                        Text("Title :  ${userlist[index].title}"),
                        Text(
                          "Body  : ${userlist[index].body}",
                        ),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
