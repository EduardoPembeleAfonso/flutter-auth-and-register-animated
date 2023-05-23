import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  static String mainUrl = 'https://api-restfull-nodejs.onrender.com';
  var loginUrl = '$mainUrl/auth';
  var registerUrl = '$mainUrl/register';
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio _dio = Dio();

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //       encryptedSharedPreferences: true,
  //     );

  Future<String?> hasToken() async {
    var value = await storage.read(key: 'token');
    return value;
  }

  Future<void> getUser(String name) async {
    await storage.write(key: 'user', value: name);
  }

  Future<void> persisteToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> signOut() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _dio
          .post(loginUrl, data: {"email": email, "password": password});
      // persisteToken(response.data['token']);
      // getUser(response.data.user.fullname);
      print(response.data);
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String fullname,
      required String phone}) async {
    try {
      var response = await _dio.post(registerUrl, data: {
        "email": email,
        "password": password,
        "fullname": fullname,
        "phone": phone,
      });
      return response.data;
      // return response.data[{'user', 'token'}];
    } catch (e) {
      throw Exception(e);
    }
  }
}
