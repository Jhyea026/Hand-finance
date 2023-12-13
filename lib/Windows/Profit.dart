// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/card.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  bool emptyScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cor.Primary50,
        body: Expanded(
          child: Stack(
            children: [
              emptyScreen
                  ? Center(
                      child: Container(
                        width: 312,
                        height: 140,
                        child: Column(
                          children: [
                            Text(
                              'Ops, você não possui receitas registradas.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromARGB(255, 63, 63, 63)),
                            ),
                            Text(
                              'Adicione suas receitas usando botão (+).',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 105, 105, 105),
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: ListView(
                        children: [
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          HomeCards(titulo: 'Receita', conteudo: []),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Cor.Primary400,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 130,
                      ),
                      Icon(
                        Icons.attach_money,
                        size: 32,
                        color: Cor.Primary50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Saldo atual',
                            style: TextStyle(color: Cor.Primary50),
                          ),
                          Text("R\$ 0,00",
                              style: TextStyle(color: Cor.Primary50))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
