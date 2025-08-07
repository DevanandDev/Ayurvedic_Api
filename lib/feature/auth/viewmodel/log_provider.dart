import 'package:ayurved/data/model/auth/auth_model.dart';
import 'package:ayurved/data/service/auth/login_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthService service = AuthService();
  AuthModel? logData;
  bool islog = false;

  Future<void> logProvider(String username, String password)async{
    islog =true;
    notifyListeners();
    try {
      logData = await service.getLoginService(username, password);
      notifyListeners();
    } catch (e) {
      throw Exception('Log Provider Failed :$e');
    }finally{
      islog = false;
      notifyListeners();
    }
  }
}