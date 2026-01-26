// lib/providers/auth_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nilecare/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AuthProvider extends ChangeNotifier {
  final String baseUrl;
  String? token;
  UserModel? user;
  bool isLoading = false;

  AuthProvider({required this.baseUrl}) {
    _loadToken();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    if (token != null) await fetchUser();
    notifyListeners();
  }

  Future<void> _saveToken(String newToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', newToken);
    token = newToken;
  }

  Future<void> _removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    token = null;
  }

  // LOGIN
  Future<bool> login(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _saveToken(data['token']);
        user = UserModel.fromJson(data['user']);
        notifyListeners();
        return true;
      }
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // REGISTRATION
  Future<bool> register(String name, String email, String password, String phone) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({

          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        await _saveToken(data['token']);
        user = UserModel.fromJson(data['user']);
        notifyListeners();
        return true;
      }
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Fetch current user
  Future<void> fetchUser() async {
    if (token == null) return;

    final response = await http.get(
      Uri.parse('$baseUrl/auth/me'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      user = UserModel.fromJson(data);
      notifyListeners();
    } else {
      await logout();
    }
  }

  // Logout
  Future<void> logout() async {
    await _removeToken();
    user = null;
    notifyListeners();
  }
}
