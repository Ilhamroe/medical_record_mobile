import 'dart:convert';
import 'package:e_klinik_pens/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceClinis {
  //get data by admin
  Future<Map<String, dynamic>> fetchAdminClinicData() async {
    final url = Uri.parse(Config.apiUrl + 'clinic/data/admin');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 403) {
      throw Exception('You do not have permission to see this data');
    } else {
      throw Exception('Failed to load clinic data');
    }
  }

  //get data by doctor
  Future<Map<String, dynamic>> fetchDoctorClinicData() async {
    final url = Uri.parse(Config.apiUrl + 'clinic/data/doctor');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 403) {
      throw Exception('You do not have permission to see this data');
    } else {
      throw Exception('Failed to load clinic data');
    }
  }


  //get data by 
  Future<Map<String, dynamic>> fetchUserClinicData() async {
    final url = Uri.parse(Config.apiUrl + 'clinic/data/user');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 403) {
      throw Exception('You do not have permission to see this data');
    } else {
      throw Exception('Failed to load clinic data');
    }
  }
}
