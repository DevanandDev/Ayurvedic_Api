import 'package:ayurved/core/constants/color_const.dart';
import 'package:flutter/material.dart';

Widget  textfield({required String text,required TextEditingController controller}) {
    return TextField(
      controller: controller,
            decoration: InputDecoration(
              hintText: text,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              
              fillColor: ColorConst.grey,
            ),
          );}