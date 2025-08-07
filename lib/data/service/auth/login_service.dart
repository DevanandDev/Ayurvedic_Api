import 'dart:developer';
import 'package:ayurved/core/constants/api_const.dart';
import 'package:ayurved/data/model/auth/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String url = ApiConst.logurl;

  Dio dio = Dio();

  Future<AuthModel?> getLoginService(String username, String password) async {
    try {
      final response = await dio.post(
        url,
        data: FormData.fromMap({
          "name":username,
          "password_text":password
        }),
        options: Options(contentType: Headers.formUrlEncodedContentType)
      );
      if (response.statusCode == 200) {
        final data = response.data;
        AuthModel authModel = AuthModel.fromJson(data);

        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("token", authModel.accessToken ?? 'No token');
        log("${authModel.accessToken}");
        log(response.statusMessage.toString());

        return authModel;
      }
    } catch (e) {
      throw Exception('Login Service Failed :$e');
    }
    return null;
  }
}



