// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';
import 'package:handfinance/Widgets/bottomSheet.dart';
import 'package:handfinance/Windows/emailVerify.dart';
import 'package:handfinance/Windows/forgotPassword.dart';
import 'package:handfinance/Windows/login.dart';
import 'package:handfinance/Windows/login_creat.dart';
import 'package:handfinance/Windows/welcome.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
