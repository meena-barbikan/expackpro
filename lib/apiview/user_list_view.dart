// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:expackpro/apiview/user_model.dart';
import 'package:flutter/material.dart';

import 'user_service.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  List<userListModel>? userlistmodel = [];
  Future? futurehandler;
  List<userListModel>? filteddata = [];

  TextEditingController search = TextEditingController();

  searchfunction() async {
    if (search.text.isNotEmpty) {
      Iterable<userListModel> result = filteddata!.where((element) {
        var data = search.text.toLowerCase().replaceAll("", "");
        if (element.firstname!
            .toLowerCase()
            .replaceAll("", "")
            .contains(data)) {
          return true;
        } else {
          return false;
        }
      });
      userlistmodel!.clear();
      userlistmodel!.addAll(result);
      setState(() {});
    } else {
      userlistmodel!.addAll(filteddata!);
      setState(() {});
    }
  }

  Future getinitdata() async {
    try {
      // loading
      //model
      UserListing model = UserListing();

      //service
      return await UserListService().listApi().then((value) {
        if (value["data"] != null) {
          for (var data in value["data"]) {
            var resultdata = userListModel.fromMap(data);
            userlistmodel!.add(resultdata);
          }
        }
        filteddata!.addAll(userlistmodel!);
        return userlistmodel;
      });
      //return
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    futurehandler = getinitdata();
    log("${userlistmodel!.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UserListing Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("Color"),
      ),
      body: FutureBuilder(
        future: futurehandler,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ListView(
            children: [
              const Text(
                "List of User",
                style: TextStyle(color: Colors.amber),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: search,
                  onChanged: (v) {
                    searchfunction();
                  },
                  decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 900,
                width: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: userlistmodel!.length,
                    itemBuilder: (context, index) {
                      var user = userlistmodel![index];
                      return Container(
                        height: 150,
                        width: 200,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index % 2 == 0
                                ? Colors.amberAccent
                                : Colors.blueGrey),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      NetworkImage(user.avatar ?? ""),
                                ),
                                Text("id     ${user.id}"),
                              ],
                            ),
                            Text(
                              "Year  : ${user.email ?? "email"}",
                              style: const TextStyle(color: Colors.amber),
                            ),
                            Text(" Value      ${user.firstname}"),
                            Text("Color      ${user.lastname}"),
                            Text("name      ${user.avatar}"),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ignore: camel_case_types
class jsonplaceholderexample extends StatefulWidget {
  const jsonplaceholderexample({super.key});

  @override
  State<jsonplaceholderexample> createState() => _jsonplaceholderexampleState();
}

// ignore: camel_case_types
class _jsonplaceholderexampleState extends State<jsonplaceholderexample> {
  List<DateModel> datamodel = [];
  Future? futurehandler;
  bool isloading = false;
  bool hasmore = true;

  bool isvisible = false;

  int totalPages = 0;
  int itemsPerPage = 20;
  int currentPage = 1;
  List<DateModel> emptyList = [];

  Future getinitdata() async {
    try {
      // loading
      //model
      DateModel model = DateModel();

      //service
      var result = await DataService().listapi();
      if (result != null) {
        for (var data in result) {
          var resultdata = DateModel.fromMap(data);
          datamodel.add(resultdata);
          print("DataModel Length: ${datamodel.length}");
        }
        setState(() {
          totalPages = (datamodel.length / itemsPerPage).ceil();
          loadPages(currentPage); // Recalculate totalPages
        });
        return datamodel;
      }
      //return
    } catch (e) {
      rethrow;
    }
  }

  void loadPages(int page) {
    setState(() {
      currentPage = page;
      int start = (page - 1) * itemsPerPage;
      int end = start + itemsPerPage;
      if (end > datamodel.length) {
        end = datamodel.length;
      }

      // Extract the data for the current page
      emptyList = datamodel.sublist(start, end);
      //emptyList.sublist(start, end > datamodel.length ? datamodel.length : end);
    });
  }

  @override
  void initState() {
    futurehandler = getinitdata();

    //log("message $totalPages");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isvisible = !isvisible;
              });
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //     child: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: List.generate(totalPages, (index) {
      //       int pageNumber = index + 1;
      //       return InkWell(
      //         onTap: () {
      //           loadPages(pageNumber);
      //         },
      //         child: Container(
      //           // padding: const EdgeInsets.all(02),
      //           margin: const EdgeInsets.all(10),
      //           height: 50,
      //           width: 60,
      //           decoration: BoxDecoration(
      //               color: Colors.blueGrey,
      //               borderRadius: BorderRadius.circular(10)),
      //           child: Text(
      //             "${pageNumber}Page",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       );
      //     }),
      //   ),
      // )),

      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      if (currentPage > 1) {
                        setState(() {
                          currentPage--;
                          loadPages(currentPage);
                        });
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(totalPages, (index) {
                        int pageNumber = index + 1;
                        return InkWell(
                          onTap: () {
                            loadPages(pageNumber);
                          },
                          child: CircleAvatar(
                            radius: 20,
                            // padding: const EdgeInsets.all(02),
                            backgroundColor: currentPage == pageNumber
                                ? Colors.blue
                                : Colors.grey,
                            child: Text(
                              "$pageNumber",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: currentPage == pageNumber
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {
                      if (currentPage < totalPages) {
                        setState(() {
                          currentPage++;
                          loadPages(currentPage);
                        });
                      }
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined))
              ],
            ),
          )),

      body: FutureBuilder(
          future: futurehandler,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator()); // Show loading
            } else if (snapshot.hasError) {
              return Center(
                  child: Text("Error: ${snapshot.error}")); // Show error
            } else if (!snapshot.hasData || datamodel.isEmpty) {
              return const Center(
                  child: Text("No data available")); // Handle empty list
            } else {
              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  if (isvisible)
                    TextFormField(
                      onTap: () {},
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: emptyList.length,
                      itemBuilder: (context, index) {
                        var data = emptyList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => usercreateview(
                                          model: data,
                                        )));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            height: 250,
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("id   : ${data.id}"),
                                Text(
                                  "body  : ${data.body}",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("title : ${data.title}"),
                                Text("userId : ${data.userId}")
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              );
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const usercreateview()));
        },
        label: const Text("Create New USER"),
      ),
    );
  }
}

// ignore: camel_case_types
class usercreateview extends StatefulWidget {
  final DateModel? model;
  const usercreateview({super.key, this.model});

  @override
  State<usercreateview> createState() => _usercreateviewState();
}

// ignore: camel_case_types
class _usercreateviewState extends State<usercreateview> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the input fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  Future Submitevent() async {
    try {
      //loading
      //model
      DateModel model = DateModel();

      model.body = _bodyController.text;
      model.title = _titleController.text;
      model.userId = int.tryParse(_userIdController.text);
      model.id = widget.model?.id;
      var id = widget.model?.id;
      // model.id = int.tryParse(id.toString());
      log("id  : ${widget.model?.id}");
      if (widget.model != null) {
        // update api
        var result =
            await DataService().updateApi(model: model, id: id.toString());
        if (result != null) {
          // ignore: duplicate_ignore
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
          //Navigator.pop(context, true);
        } else {
          Navigator.pop(context);
        }
      } else {
        // create api
        var result = await DataService().createApi(model: model);
        if (result != null) {
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
          // Navigator.pop(context, true);
        } else {
          Navigator.pop(context);
        }
      }
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${e.toString()}")));
    }
  }

  Future deleteEvent() async {
    try {
      // loading
      //model
      DateModel model = DateModel();
      var id = widget.model?.id;
      // service
      var result = await DataService().delApi(model: model, id: id.toString());
      if (result != null) {
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      rethrow;
    }
  }

  initfn() {
    setState(() {
      //model
      if (widget.model != null) {
        var model = widget.model;
        _bodyController.text = model?.body.toString() ?? "";
        _titleController.text = model?.title.toString() ?? "";
        _userIdController.text = model?.userId.toString() ?? "";
      }
    });
  }

  @override
  void initState() {
    initfn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Create Api"),
        actions: [
          IconButton(
            onPressed: () {
              deleteEvent();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Field
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Body Field
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: "Body",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a body";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // User ID Field
              TextFormField(
                controller: _userIdController,
                decoration: const InputDecoration(
                  labelText: "User ID",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a user ID";
                  }
                  if (int.tryParse(value) == null) {
                    return "Please enter a valid number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Submitevent();
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class commnetsview extends StatefulWidget {
  const commnetsview({super.key});

  @override
  State<commnetsview> createState() => _commnetsviewState();
}

class _commnetsviewState extends State<commnetsview> {
  Future? futurehandler;
  List<CommonModel> commonmodel = [];
  Future getinitdata() async {
    // loading
    // model
    CommonModel model = CommonModel();
    var data = await CommonService().commonlist(model: model);
    if (data != null) {
      for (var result in data) {
        var resultdata = CommonModel.fromJson(result);
        commonmodel.add(resultdata);
      }
      return commonmodel;
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
      appBar: AppBar(
        title: const Text("Comments View"),
      ),
      body: FutureBuilder(
          future: futurehandler,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator()); // Show loading
            } else if (snapshot.hasError) {
              return Center(
                  child: Text("Error: ${snapshot.error}")); // Show error
            } else if (!snapshot.hasData || commonmodel.isEmpty) {
              return const Center(
                  child: Text("No data available")); // Handle empty list
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: commonmodel.length,
                  itemBuilder: (context, index) {
                    var list = commonmodel[index];
                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: 180,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Post Id   : ${list.postid}"),
                          Text("Id : ${list.id} "),
                          Text("Name : ${list.name}"),
                          Text("Email : ${list.email}"),
                          Text(
                            "Body : ${list.body}",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
