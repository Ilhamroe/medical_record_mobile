import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_klinik_pens/config/config.dart';
import 'package:e_klinik_pens/models/users.dart';
import 'package:e_klinik_pens/utils/routes.dart';
import 'package:e_klinik_pens/widgets/common/alert_success.dart';
import 'package:e_klinik_pens/widgets/common/alert_danger.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceAuth {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> registerUser(
      Map<String, dynamic> userData) async {
    print('$userData');
    final url = Config.apiUrl + 'register';

    try {
      final response = await _dio.post(
        url,
        data: jsonEncode(userData),
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          followRedirects: false,
        ),
      );

      if (response.statusCode == 302) {
        final redirectedUrl = response.headers['location']![0];
        final redirectedResponse = await _dio.post(
          redirectedUrl,
          data: jsonEncode(userData),
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
          ),
        );

        if (redirectedResponse.statusCode == 201 ||
            redirectedResponse.statusCode == 200) {
          final data = redirectedResponse.data;
          return data;
        } else {
          throw Exception('Failed to register user after redirect');
        }
      } else if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        return data;
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> userData) async {
    final url = Config.apiUrl + 'login';

    try {
      final response = await _dio.post(
        url,
        data: jsonEncode(userData),
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', responseData['token']);
        await prefs.setInt('userId', responseData['user']['id']);

        return responseData;
      } else {
        print('Failed to login user: ${response.statusCode}');
        print('Response body: ${response.data}');
        throw Exception('Failed to login user');
      }
    } catch (e) {
      throw Exception('Failed to login user: $e');
    }
  }

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
              route: AppRoutes.login,
              confirmText: 'Tutup',
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
          );
        },
      );
    }
  }

  Future<List<User>> getAllUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await _dio.get(
      Config.apiUrl + 'user/data',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = response.data;
      List<dynamic> userData = jsonResponse['user'];
      return userData.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future<User> getUserById(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await _dio.get(
      Config.apiUrl + 'user/data/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data['user'];
      if (data != null) {
        return User.fromJson(data);
      } else {
        throw Exception('User data is null');
      }
    } else {
      throw Exception('Failed to load user');
    }
  }

  //buat fungsi untuk update
  Future<Map<String, dynamic>> updateUserData(
      Map<String, dynamic> userData, int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    print('user data : $userData');
    if (token == null) {
      throw Exception('Token not found');
    }

    final url = Config.apiUrl + 'user/update/$id';
    try {
      final response = await _dio.patch(
        url,
        data: jsonEncode(userData),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json'
          },
          followRedirects: false,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to update user: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to update user: $e');
    }
  }

  //delete data
  Future<void> deleteUser(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final url = Config.apiUrl + 'user/delete/$id';
    try {
      final response = await _dio.delete(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json'
          },
          followRedirects: false,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
      } else {
        throw Exception('Failed to delete user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
