class UserModel {
  String? userid;
  String? name;
  String? password;
  int? id;
  String? phonenumber;
  String? email;
  String? age;
  UserModel(
      {this.name,
      this.password,
      this.userid,
      this.id,
      this.phonenumber,
      this.age,
      this.email});

  // ignore: non_constant_identifier_names
  factory UserModel.fromJson(Map<String, dynamic> Json) {
    return UserModel(
        userid: Json["user_id"]?.toString() ?? "",
        name: Json["name"]?.toString() ?? "",
        password: Json["password"]?.toString() ?? "",
        id: Json["id"]
        //  phonenumber: Json["PhoneNumber"]?.toString() ?? "PhoneNumer",
        );
  }

  tocreateMap() {
    return {
      "user_id": userid,
      "name": name,
      "password": password,
      "PhoneNumber": phonenumber,
    };
  }

  toUpdateMap() {
    return {
      "name": name,
      "password": password,
      "id": id,
    };
  }
}

//  id INTEGER PRIMARY KEY AUTOINCREMENT,
//             companyName TEXT NOT NULL,
//             CompanyId INTEGER NOT NULL,
//             CompanyAddress TEXT NOT NULL,
//             CompanyEmail TEXT NOT NULL,
//             CompanyPhone INTEGER NOT NULL,
//             city TEXT NOT NULL,
//             Pincode TEXT NOT NULL,
//             Bankname TEXT NOT NULL

class CompanyModel {
  String? id;
  String? companyname;
  String? address;
  String? companyId;
  String? email;
  String? city;
  String? pincode;
  String? bankname;
  String? phonenumber;
  CompanyModel({
    this.address,
    this.bankname,
    this.city,
    this.companyId,
    this.companyname,
    this.email,
    this.id,
    this.phonenumber,
    this.pincode,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> map) {
    return CompanyModel(
      address: map["CompanyAddress"]?.toString() ?? "",
      bankname: map["Bankname"]?.toString() ?? "",
      city: map["city"]?.toString() ?? "",
      companyId: map["CompanyId"]?.toString() ?? "",
      id: map["id"]?.toString() ?? "",
      pincode: map["Pincode"]?.toString() ?? "",
      companyname: map["companyName"]?.toString() ?? "",
      email: map["CompanyEmail"]?.toString() ?? "",
      phonenumber: map["CompanyPhone"]?.toString() ?? "",
    );
  }
}
