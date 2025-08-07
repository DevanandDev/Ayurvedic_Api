import 'package:ayurved/core/constants/color_const.dart';
import 'package:flutter/material.dart';

Widget  textfield({required String text}) {
    return TextField(
            decoration: InputDecoration(
              hintText: text,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              filled: true,
              fillColor: ColorConst.grey,
            ),
          );}