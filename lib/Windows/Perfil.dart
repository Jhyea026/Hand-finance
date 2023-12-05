// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 82,
        backgroundColor: Cor.Primary400,
        title: Row(
          children: [Text('Perfil')],
        ),
      ),
      body: Center(
        child: Column(
          children: [Text('data')],
        ),
      ),
    );
  }
}
