class ApiModel {
  int? userid;
  int? id;
  String? title;
  String? body;
  ApiModel({
    this.body,
    this.id,
    this.title,
    this.userid,
  });
  factory ApiModel.fromMap(Map<String, dynamic> map) {
    return ApiModel(
      userid: map["userId"] ?? 0,
      id: map["id"] ?? 0,
      title: map["title"] ?? "",
      body: map["body"] ?? "",
    );
  }
}
