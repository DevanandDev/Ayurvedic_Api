import 'package:ayurved/core/constants/asset_image.dart';
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
    super.initState();
    Future.delayed(Duration(seconds: 5),() {
      context.push('/login');
    },);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child:  Image.asset(Asseturl.splashImage,fit: BoxFit.fill),
      )
     
    );
  }
}
