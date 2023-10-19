
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthPasswordDecoration {

  InputDecoration decoration(String label, [Widget? icon,Icons]) => InputDecoration(
    suffixIcon: Icons,
    prefixIcon: icon,
    prefixIconColor: Colors.grey,

    floatingLabelBehavior: FloatingLabelBehavior.never,
    floatingLabelAlignment: FloatingLabelAlignment.center,
    hintText: "   $label",
    hintStyle: const TextStyle(color:  Colors.black54, fontSize: 12),
    contentPadding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
    border: const OutlineInputBorder(
        borderSide: BorderSide(
          color:  Colors.black26,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        )),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color:  Colors.black26,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        )),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color:  Colors.black26,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        )),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        )),
  );
}