import 'package:flutter/cupertino.dart';

Widget text({required String text}) {
    return Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          );
  }