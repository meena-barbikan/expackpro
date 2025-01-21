import 'package:expackpro/apiview/user_model.dart';
import 'package:expackpro/apiview/user_service.dart';
import 'package:flutter/material.dart';

class UserlistPlace extends StatefulWidget {
  const UserlistPlace({super.key});

  @override
  State<UserlistPlace> createState() => _UserlistPlaceState();
}

class _UserlistPlaceState extends State<UserlistPlace> {
  Future? futurehandler;
  List<UserListPlaceModel> listmodellist = [];
  Future listingApi() async {
    try {
      // loading

      //model
      UserListPlaceModel model = UserListPlaceModel();

      //Service
      var result = await UserListingPlaceService().userListPlace(model: model);
      if (result != null) {
        for (var element in result) {
          var data = UserListPlaceModel.fromJson(element);
          listmodellist.add(data);
        }
        return listmodellist;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    futurehandler = listingApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List Page"),
      ),
      body: FutureBuilder(
          future: futurehandler,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return ListView.builder(
                itemCount: listmodellist.length,
                itemBuilder: (BuildContext context, int index) {
                  var list = listmodellist[index];
                  return Container(
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Id   : ${list.id}  "),
                        Text("Name  : ${list.name}"),
                        Text("UserName  : ${list.username}"),
                        Text("Email  : ${list.email}"),
                        Text("Address  :${list.model?.suite}"),
                        Text("Street  : ${list.model?.street}"),
                        Text("City  :${list.model?.city}"),
                        Text("Zipcode  : ${list.model?.zipcode}"),
                        Text("Phone  : ${list.phone}"),
                        Text("Website   : ${list.website}"),
                        Text("Company   : ${list.companymodel?.companyname}"),
                        Text("Bs  : ${list.companymodel?.bs}")
                      ],
                    ),
                    //)
                    //],
                  );
                });
          }),
    );
  }
}
