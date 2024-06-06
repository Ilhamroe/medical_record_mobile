import 'dart:convert';
import 'package:e_klinik_pens/config/config.dart';
import 'package:e_klinik_pens/models/clinics.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class ServiceClinic {
  final Dio _dio = Dio();
  //get data by admin
  Future<List<Clinic>> fetchAdminClinicData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await _dio.get(
      Config.apiUrl + 'clinic/data/admin',
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
      List<dynamic> clininData = jsonResponse['user'];
      return clininData.map((user) => Clinic.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }

  //get data by doctor
  Future<List<Clinic>> fetchDoctorClinicData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await _dio.get(
      Config.apiUrl + 'clinic/data/dokter',
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
      List<dynamic> clininData = jsonResponse['user'];
      return clininData.map((user) => Clinic.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }

  //get data by
  Future<List<Clinic>> fetchUserClinicData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await _dio.get(
      Config.apiUrl + 'clinic/data/user',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
      ),
    );
    print('emb:$response');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = response.data;
      print('tes;$jsonResponse');
      List<dynamic> clininData = jsonResponse['data'];
      return clininData.map((user) => Clinic.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }

  //store untuk menyimpan
  Future<Map<String, dynamic>> clinicStore(
      Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    final url = Config.apiUrl + 'clinic';

    try {
      final response = await _dio.post(
        url,
        data: jsonEncode(userData),
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json'
          },
        ),
      );

      if ((response.statusCode ?? 300) >= 201 &&
          (response.statusCode ?? 300) < 300) {
        final responseData = response.data;
        print('cok :$responseData');
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

  //update untuk mengedit
  Future<Map<String, dynamic>> updateClinic(
      Map<String, dynamic> clininData, int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    print('user data : $clininData');
    if (token == null) {
      throw Exception('Token not found');
    }

    final url = Config.apiUrl + 'clinic/update/$id';
    try {
      final response = await _dio.patch(
        url,
        data: jsonEncode(clininData),
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

  Future<void> deleteUser(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final url = Config.apiUrl + 'clinic/delete/$id';
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
