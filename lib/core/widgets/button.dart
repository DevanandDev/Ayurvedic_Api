import 'package:ayurved/core/constants/color_const.dart';
import 'package:ayurved/core/constants/text_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget submitBtn() {
    return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                         
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConst.darkGreen,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            TextConst.registerNow,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorConst.white,
                            ),
                          ),
                        ),
                      );
  }