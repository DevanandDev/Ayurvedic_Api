import 'package:ayurved/core/constants/asset_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplsh extends StatefulWidget {
  const MySplsh({super.key});

  @override
  State<MySplsh> createState() => _MySplshState();
}

class _MySplshState extends State<MySplsh> {
  @override
  void initState() {
    super.initState();
    checkLog();
  }

  Future<void> checkLog() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token =  pref.getString("token");
    await Future.delayed(Duration(seconds: 3));

    if (token != null && token.isNotEmpty) {
      context.push('/home');
    } else {
      context.push('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(Asseturl.splashImage, fit: BoxFit.fill),
      ),
    );
  }
}
