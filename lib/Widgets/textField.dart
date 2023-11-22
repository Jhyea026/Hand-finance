// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';

class myTextField extends StatefulWidget {
  String labText;
  FocusNode myFocusNode = new FocusNode();
  TextEditingController controller = TextEditingController();

  myTextField({super.key, required this.labText, required this.controller});

  @override
  State<myTextField> createState() => _myTextFieldState();
}

class _myTextFieldState extends State<myTextField> {
  void initial() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Cor.Primary400),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Cor.Primary400, width: 2)),
          labelText: widget.labText,
        ));
  }
}
