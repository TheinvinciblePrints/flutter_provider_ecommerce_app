import 'dart:convert';

import 'package:ecommerceapp/core/models/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await client.get('$endpoint/users/$userId');

    print('userResponse: ${json.decode(response.body)}');
    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

  Future<User> login(String email, String password) async {
    final url = "$endpoint/login";

    Map<String, String> body = {
      'email': email,
      'password': password,
    };

    final response = await client.post(
      url,
      body: body,
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 401) {
      FlutterToast.showToast(
          msg: "Invalid email or password.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return null;
    }

    FlutterToast.showToast(
        msg: "Server error.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    return null;
  }
}
