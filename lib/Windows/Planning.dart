// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';

class Planning extends StatelessWidget {
  const Planning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cor.Primary50,
        body: Center(
          child: Container(
            height: 200,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Ooops!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 63, 63, 63)),
                      ),
                      Text(
                        'Nenhum planejamento para mostar :(',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 63, 63, 63)),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Botao(
                        label: 'Copiar mês anterior',
                        onPressed: () {},
                        largura: 211,
                      ),
                      Botao(
                        label: 'Definir novo planejamento',
                        onPressed: () {},
                        style: false,
                        largura: 211,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
