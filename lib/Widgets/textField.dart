// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';

class myTextField extends StatefulWidget {
  String labText;
  bool password;
  bool isVisible;
  TextEditingController controller = TextEditingController();

  myTextField(
      {super.key,
      required this.labText,
      required this.controller,
      this.password = false,
      this.isVisible = false});

  @override
  State<myTextField> createState() => _myTextFieldState();
}

class _myTextFieldState extends State<myTextField> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void visibility() {
    setState(() {
      widget.isVisible = !widget.isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: widget.isVisible,
        focusNode: _focusNode,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.password
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: IconButton(
                    onPressed: visibility,
                    icon: widget.isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    color: _isFocused ? Cor.Primary400 : null,
                  ), // myIcon is a 48px-wide widget.
                )
              : null,
          labelStyle:
              TextStyle(color: _isFocused ? Cor.Primary400 : Colors.black54),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Cor.Primary400, width: 2)),
          labelText: widget.labText,
        ));
  }
}
