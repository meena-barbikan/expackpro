import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class ConfigServiceApi {
  String domainname = "https://jsonplaceholder.typicode.com";
  Future postApi({required String filename, required Map mapModel}) async {
    try {
      var response = await http.post(
        Uri.parse("$domainname$filename"),
        body: json.encode(mapModel),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return result;
      } else {
        throw "Failed ${response.body} Error Code";
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future getApi({
    required String filename,
  }) async {
    try {
      var response = await http.get(
        Uri.parse("$domainname$filename"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return result;
      } else {
        throw "Failed ${response.body} Error Code";
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
