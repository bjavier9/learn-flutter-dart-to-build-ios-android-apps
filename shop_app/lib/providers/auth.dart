import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expireDate;
  String _userId;
  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    var url =
        "https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyDwb8leKlda-_Y6I9ZfgGD5OixYy0HdM1g";
    final response = await http.post(url,
        body: json.encode(
            {"email": email, "password": password, "returnSecureToken": true}));
    print(json.decode(response.body));
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, "signupNewUser");
  }

  Future<void> Login(String email, String password) async {
    return _authenticate(email, password, "verifyPassword");
  }
}
