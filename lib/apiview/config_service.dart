import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpConfig {
  final String domain = "https://jsonplaceholder.typicode.com";

  //"https://reqres.in";

  Future postApi({
    required String filename,
    required Map mapModel,
    String? token,
  }) async {
    try {
      log("$domain$filename");
      var response = await http.post(Uri.parse("$domain$filename"),
          body: json.encode(mapModel),
          headers: {
            "Authorization": token ?? "",
            HttpHeaders.contentTypeHeader: "application/json",
          });
      if (response.statusCode == 200) {
        log("${response.body}");

        var result = json.decode(response.body);
        return result;
      } else {
        log("${response.body}");
        throw "Failed ${response.body} ErrorCode";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getApi({
    required String filename,
    required Map mapModel,
    String? token,
  }) async {
    try {
      log("$domain$filename");
      var response = await http.get(Uri.parse("$domain$filename"), headers: {
        "Authorization": token ?? "",
        HttpHeaders.contentTypeHeader: "application/json",
      });
      if (response.statusCode == 200) {
        // log("${response.body}");
        var result = json.decode(response.body);
        return result;
      } else {
        throw "Failed ${response.body} Errorcode";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future putApi({
    required String filename,
    required Map mapModel,
    String? token,
  }) async {
    try {
      log("$domain$filename");
      var response = await http.put(Uri.parse("$domain$filename"),
          body: json.encode(mapModel),
          headers: {
            "Authorization": token ?? "",
            HttpHeaders.contentTypeHeader: "application/json",
          });
      if (response.statusCode == 200) {
        log("${response.body}");
        var result = json.decode(response.body);
        return result;
      } else {
        log("${response.body}");
        throw "Failed ${response.body} Error Code";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future deleteApi({
    required String filename,
    required Map mapModel,
    String? token,
  }) async {
    try {
      log("$domain$filename");
      var response = await http.delete(Uri.parse("$domain$filename"),
          body: json.encode(mapModel),
          headers: {
            "Authorization": token ?? "",
            HttpHeaders.contentTypeHeader: "application/json",
          });
      if (response.statusCode == 200) {
        log("${response.body}");
        var result = json.decode(response.body);
        return result;
      } else {
        log("${response.body}");
        throw "Failed ${response.body} Error Code";
      }
    } catch (e) {
      rethrow;
    }
  }
}
