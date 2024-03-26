// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> get({required String url, String? token}) async {
    Map<String, String> headers = {
      // 'Accept': 'application/json',
    };

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      // print('=======status code is ${response.statusCode}===========');

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        // print('=========length of data :${data.length}=========');
        return data;
      } else {
        throw Exception(
            'there is an exception with status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
      // print('=========Exception is ${e.toString()}==========');
    }
  }

  Future<dynamic> getItem({
    required String url,
    required int id,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    try {
      String urlId = '$url$id';
      // print(urlId);
      http.Response response = await http.get(Uri.parse(urlId));
      // print(response);
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);
        print("==========data in api class ${data}=======");
        return data;
      } else {
        throw Exception(
            'there is an exception with status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
      // print('=========Exception is ${e.toString()}==========');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is an exception with status code ${response.statusCode} and response body is ${response.body}');
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};

    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    print('url $url ,body $body, token $token');

    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      print('body $body');

      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is an exception with status code ${response.statusCode} and response body is ${response.body}');
    }
  }

  Future<dynamic> delete({
    required String url,
    String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    print('url $url ,token $token');
    http.Response response =
        await http.delete(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is an exception with status code ${response.statusCode} and response body is ${response.body}');
    }
  }
}
