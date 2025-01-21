class UserModel {
  String email;
  String password;

  UserModel({
    required this.email,
    required this.password,
  });
  factory UserModel.fromMap(map) {
    return UserModel(
      email: map["email"],
      password: map["password"],
    );
  }

  toResigster() {
    return {
      "email": email,
      "password": password,
    };
  }

  toLoginMap() {
    return {
      "email": email,
      "password": password,
    };
  }
}

class UserListing {
  String? page;
  String? perpage;
  String? total;
  String? totalpage;
  List<userListModel>? userlistmodel;
  UserListing({
    this.page,
    this.perpage,
    this.total,
    this.totalpage,
    this.userlistmodel,
  });

  factory UserListing.fromMap(Map<String, dynamic> map) {
    return UserListing(
        page: map["page"]?.toString() ?? "",
        perpage: map["per_page"]?.toString() ?? "",
        total: map["total"]?.toString() ?? "",
        totalpage: map["total_pages"]?.toString() ?? "",
        userlistmodel: [
          for (var data in map["data"]) userListModel.fromMap(data)
        ]);
  }
}

class userListModel {
  String? id;
  String? email;
  String? firstname;
  String? lastname;
  String? avatar;
  userListModel({
    this.avatar,
    this.email,
    this.firstname,
    this.id,
    this.lastname,
  });
  factory userListModel.fromMap(Map<String, dynamic> map) {
    return userListModel(
      id: map["id"]?.toString() ?? "",
      avatar: map["avatar"]?.toString() ?? "",
      email: map["email"]?.toString() ?? "",
      firstname: map["first_name"]?.toString() ?? "",
      lastname: map["last_name"]?.toString() ?? "",
    );
  }
}

class DateModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  DateModel({
    this.id,
    this.userId,
    this.body,
    this.title,
  });
  factory DateModel.fromMap(map) {
    return DateModel(
      id: map["id"],
      userId: map["userId"],
      body: map["body"],
      title: map["title"],
    );
  }
  tocreateMap() {
    return {
      'title': title,
      'userId': userId,
      'body': body,
    };
  }

  toupdateMap() {
    return {
      'title': title,
      'userId': userId,
      'body': body,
      "id": id,
    };
  }
}

class CommonModel {
  String? postid;
  String? id;
  String? name;
  String? email;
  String? body;

  CommonModel({
    this.body,
    this.email,
    this.id,
    this.name,
    this.postid,
  });
  factory CommonModel.fromJson(map) {
    return CommonModel(
      email: map["email"]?.toString() ?? "",
      body: map["body"]?.toString() ?? "",
      name: map["name"]?.toString() ?? "",
      postid: map["postId"]?.toString() ?? "",
      id: map["id"]?.toString() ?? "",
    );
  }
}

class UserListPlaceModel {
  String? id;
  String? name;
  String? username;
  String? email;
  AddressModel? model;
  String? phone;
  String? website;
  CompanyModel? companymodel;

  UserListPlaceModel({
    this.companymodel,
    this.email,
    this.id,
    this.model,
    this.name,
    this.phone,
    this.username,
    this.website,
  });

  factory UserListPlaceModel.fromJson(Map) {
    return UserListPlaceModel(
      id: Map["id"]?.toString() ?? "",
      name: Map["name"]?.toString() ?? "",
      username: Map["username"]?.toString() ?? "",
      email: Map["email"]?.toString() ?? "",
      phone: Map["phone"]?.toString() ?? "",
      website: Map["website"]?.toString() ?? "",
      model: AddressModel.fromJson(Map["address"]),
      companymodel: CompanyModel.fromJson(Map["company"]),
    );
  }
}

class AddressModel {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geomodel? geomodel;

  AddressModel(
      {this.street, this.suite, this.city, this.geomodel, this.zipcode});

  factory AddressModel.fromJson(Map) {
    return AddressModel(
      city: Map["city"]?.toString() ?? "",
      street: Map["street"]?.toString() ?? "",
      suite: Map["suite"]?.toString() ?? "",
      zipcode: Map["zipcode"]?.toString() ?? "",
      geomodel: Geomodel.fromJson(Map["geo"]),
    );
  }
}

class Geomodel {
  String? lat;
  String? lng;
  Geomodel({this.lat, this.lng});
  factory Geomodel.fromJson(Map) {
    return Geomodel(
      lat: Map["lat"]?.toString() ?? "",
      lng: Map["lng"]?.toString() ?? "",
    );
  }
}

class CompanyModel {
  String? bs;
  String? companyname;
  String? catchphrase;

  CompanyModel({
    this.bs,
    this.catchphrase,
    this.companyname,
  });

  factory CompanyModel.fromJson(Map) {
    return CompanyModel(
      bs: Map["bs"]?.toString() ?? "",
      catchphrase: Map["catchPhrase"]?.toString() ?? "",
      companyname: Map["name"]?.toString() ?? "",
    );
  }
}
