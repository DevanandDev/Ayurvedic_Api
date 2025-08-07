import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MySplsh extends StatefulWidget {
  const MySplsh({super.key});

  @override
  State<MySplsh> createState() => _MySplshState();
}

class _MySplshState extends State<MySplsh> {
  @override
  void initState() {
    logScreen();
    context.push('login');
    super.initState();
  }

  void logScreen() {
    Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green);
  }
}
