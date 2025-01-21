import 'dart:developer';

import 'package:expackpro/sqlite/user_model.dart';

import 'package:flutter/material.dart';

import 'user_createSqlite_view.dart';
import 'user_service.dart';
import 'package:flutter/material.dart';

class UserListViewSqlite extends StatefulWidget {
  const UserListViewSqlite({super.key});

  @override
  State<UserListViewSqlite> createState() => _UserListViewSqliteState();
}

class _UserListViewSqliteState extends State<UserListViewSqlite> {
  List<UserModel> userlist = [];
  Future? futurehandler;
  Future getinitdata() async {
    try {
      setState(() {
        userlist.clear();
      });
      var userdata = await UserService().listUser();
      userlist.addAll(userdata);
      return userlist;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    futurehandler = getinitdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("UserListing Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserCreatesqliteView()))
              .then((onValue) {
            setState(() {
              futurehandler = getinitdata();
            });
          });
        },
        child: Text("Create"),
      ),
      body: FutureBuilder(
          future: futurehandler,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return ListView(
              padding: const EdgeInsets.all(10),
              children: [
                ListView.builder(
                    itemCount: userlist.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserCreatesqliteView(
                                        usermodel: userlist[index],
                                      ))).then((onValue) {
                            setState(() {
                              futurehandler = getinitdata();
                            });
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Text("${index + 1}"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    userlist[index].name.toString() ?? "",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  // Text(
                                  //   userlist[index].phonenumber.toString() ??
                                  //       "",
                                  //   style: const TextStyle(
                                  //       color: Colors.black, fontSize: 16),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            );
          }),
    );
  }
}

class companyviewsqlite extends StatefulWidget {
  const companyviewsqlite({super.key});

  @override
  State<companyviewsqlite> createState() => _companyviewsqliteState();
}

class _companyviewsqliteState extends State<companyviewsqlite> {
  List<CompanyModel> companylist = [];

  Future getinitdata() async {
    try {
      CompanyModel model = CompanyModel();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CompanyListView"),
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Text("${index + 1}"),
                    Column(
                      children: [
                        Text("${""}"),
                        Text("${""}"),
                        Text("${""}"),
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
