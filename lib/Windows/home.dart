// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cor.Primary50,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Center(
              child: Column(
                children: [
                  HomeCards(
                    titulo: 'Resumo da sua carteira',
                    conteudo: [],
                  ),
                  HomeCards(
                    titulo: 'Cartões de credito',
                    conteudo: [],
                  ),
                  HomeCards(
                    titulo: 'Planejamento',
                    conteudo: [],
                  ),
                  HomeCards(
                    titulo: 'Economia mensal',
                    conteudo: [],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
