import 'package:flutter/material.dart';

class MySplsh extends StatefulWidget {
  const MySplsh({super.key});

  @override
  State<MySplsh> createState() => _MySplshState();
}

class _MySplshState extends State<MySplsh> {
  @override
  void initState() {
    logScreen();
    
    super.initState();
  }
  void logScreen(){
    Future.delayed(Duration(seconds: 3));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}