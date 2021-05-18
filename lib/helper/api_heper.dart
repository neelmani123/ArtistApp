import 'dart:convert';
import 'dart:io';
import 'package:artist_icon/helper/setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class ApiBaseHelper {


  Future<dynamic> post(String url,Map reqBody) async {
    var responseJson;
    debugPrint("content ==>"+aPPmAINuRL+ url);
    final response = await http.post(aPPdOMAIN+ url ,body: jsonEncode(reqBody),headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    print("content ==>"+response.body);
    responseJson = _returnResponse(response);
    return  responseJson;
  }



  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 401:

        return null;
      default:
        return null;
    }
  }

}