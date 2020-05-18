import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expireDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get userId {
    return _userId;
  }

  String get token {
    if (_expireDate != null &&
        _expireDate.isAfter(DateTime.now()) &&
        _token != null) {
      print(_token);
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    var url =
        "https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyDwb8leKlda-_Y6I9ZfgGD5OixYy0HdM1g";
    try {
      final response = await http.post(url,
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true
          }));
      // print(json.decode(response.body));
      final responseData = json.decode(response.body);
      print(responseData);
      // print(responseData);
      if (responseData['error'] != null) {
        print('error');
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expireDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, "signupNewUser");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "verifyPassword");
  }
}
