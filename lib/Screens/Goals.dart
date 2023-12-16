// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';

class Goals extends StatelessWidget {
  const Goals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cor.Primary50,
        body: Center(
          child: Container(
            width: 332,
            height: 194,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ops! você não possui objetivos cadastrados.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 63, 63, 63)),
                ),
                Text(
                  'Economizar é muito mais facil quando se tem um objetivo! Que tal criar o seu?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 105, 105, 105), fontSize: 14),
                ),
                Botao(label: 'Criar novo objetivo', onPressed: () {})
              ],
            ),
          ),
        ));
  }
}
