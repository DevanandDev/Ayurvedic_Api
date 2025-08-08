import 'package:ayurved/core/constants/color_const.dart';
import 'package:ayurved/core/constants/asset_image.dart';
import 'package:ayurved/core/constants/text_const.dart';
import 'package:ayurved/core/widgets/textfield.dart';
import 'package:ayurved/feature/auth/viewmodel/log_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyLogin extends StatefulWidget {
  MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConst.white,
        body: SingleChildScrollView(
          child: Consumer<AuthProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(Asseturl.logImage, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          TextConst.logCaption,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 30),
                        textfield(
                          controller: usernameController,
                          text: TextConst.enterEmail,
                        ),
                        const SizedBox(height: 20),
                        textfield(
                          controller: passwordController,
                          text: TextConst.enterPassword,
                        ),
                        const SizedBox(height: 40),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              value.islog
                                  ? null
                                  : await value.logProvider(
                                    usernameController.text.trim(),
                                    passwordController.text.trim(),
                                  );

                              if (value.logData?.accessToken != null ||
                                  value.logData?.status == true) {
                                context.pushReplacement('/home');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login Successfull')),
                                );
                              } else {
                                context.push('/login');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login Failed')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConst.darkGreen,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              TextConst.login,
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorConst.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: TextConst.logLastCaption,
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            children: [
                              TextSpan(
                                text: TextConst.termsCondition,
                                style: TextStyle(
                                  color: ColorConst.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(text: TextConst.and),
                              TextSpan(
                                text: TextConst.policy,
                                style: TextStyle(
                                  color: ColorConst.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
