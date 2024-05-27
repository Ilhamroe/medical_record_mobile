import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_klinik_pens/config/config.dart';
import 'package:e_klinik_pens/utils/routes.dart';
import 'package:e_klinik_pens/widgets/common/alert_confirm.dart';
import 'package:e_klinik_pens/widgets/common/alert_danger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_klinik_pens/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceAuth {
  //getAlldata as index
  Future<List<User>> getAllData() async {
    final response = await http.get(Uri.parse(Config.apiUrl + 'user/data'));

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> userData = jsonResponse['user'];
      return userData.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }

  //register as register
  Future<Map<String, dynamic>> registerUser(
      Map<String, dynamic> userData) async {
    final url = Uri.parse(Config.apiUrl + 'register');
    final client = http.Client();

    try {
      final response = await client.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 302) {
        final redirectedUrl = response.headers['location'];
        final redirectedResponse = await client.post(
          Uri.parse(redirectedUrl!),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(userData),
        );
        if (redirectedResponse.statusCode == 201 ||
            redirectedResponse.statusCode == 200) {
          return jsonDecode(redirectedResponse.body);
        } else {
          throw Exception('Failed to register user after redirect');
        }
      } else if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to register user');
      }
    } finally {
      client.close();
    }
  }

  //login as login
  // Future<Map<String, dynamic>> loginUser(Map<String, dynamic> userData) async {
  //   final response = await http.post(
  //     Uri.parse(Config.apiUrl + 'login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(userData),
  //   );

  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     print('Failed to login user: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //     throw Exception('Failed to login user');
  //   }
  // }

  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse(Config.apiUrl + 'login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', responseData['token']);

      return responseData;
    } else {
      print('Failed to login user: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to login user');
    }
  }

  //Logout as logout
  final Dio _dio = Dio();

  Future<void> logoutUser(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');

      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await _dio.get(
        Config.apiUrl + 'logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        await prefs.remove('accessToken');

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertConfirm(
              titleText: "Sukses",
              descText: "Akun anda telah berhasil logout",
              route: AppRoutes.logreg,
            );
          },
        );
      } else {
        throw Exception('Failed to log out');
      }
    } catch (e) {
      print('Logout failed: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDanger(
            titleText: "Gagal",
            descText: "Anda gagal untuk logout.",
            route: AppRoutes.homeuser,
          );
        },
      );
    }
  }
}
