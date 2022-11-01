import 'package:flutter/material.dart';
import 'package:schoolman/Colors.dart';

Widget textField(TextEditingController controller, TextInputType textInputType,
    String? Function(String?)? validator, String hintText) {
  return TextFormField(
    controller: controller,
    // maxLength: 10,
    keyboardType: textInputType,

    validator: validator,
    //  (value) {
    //     if (value!.isEmpty) {
    //        return " enter";
    //     }
    //     return null;
    // },

    decoration: InputDecoration(
      hintText: hintText,
      prefixStyle: TextStyle(color: Colors.white),
      // prefixText: "+91",
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          // width: 3,
          color: bg,
        ), //<-- SEE HERE
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          // width: 3,
          color: bg,
        ), //<-- SEE HERE
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          // width: 3,
          color: Colors.red,
        ), //<-- SEE HERE
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          // width: 3,
          color: bg,
        ), //<-- SEE HERE
      ),
    ),
  );
}
