import 'package:flutter/material.dart';
import 'package:full_application/Models/authmodel.dart';
import 'package:full_application/Services/authservice.dart';

class Authprovider extends ChangeNotifier {
  AuthModel? auth;
   Future<bool> useerlogin({
    required String email,
    required String password,
  }) async {
    final response = await Authservice.login(email: email, password: password);
    auth = response;
    return response.status;
  }

    Future<bool> userregister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final response = await Authservice.register(
      email: email,
      password: password,
      phone: phone,
      name: name,
    );
    auth = response;
    return response.status;
  }
}
