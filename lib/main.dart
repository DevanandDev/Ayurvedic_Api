import 'package:ayurved/core/routes/go_route.dart';
import 'package:ayurved/feature/auth/viewmodel/log_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider(),)
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
     debugShowCheckedModeBanner: false,
    );
  }
}