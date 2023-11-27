// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';
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
                    conteudo: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    'Saldo atual',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105)),
                                  ),
                                  Text(
                                    'RS 0,00',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 270,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('lib/Assets/Loss.png'),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Despesas',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 105, 105, 105)),
                                          ),
                                          Text(
                                            'RS 0,00',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 105, 105, 105)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('lib/Assets/Win.png'),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Receita',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 105, 105, 105)),
                                          ),
                                          Text(
                                            'RS 0,00',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 105, 105, 105)),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  HomeCards(
                    titulo: 'Cartões de credito',
                    altura: 170,
                    conteudo: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: 248,
                        height: 139,
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset('lib/Assets/Credit_card.png'),
                              Column(
                                children: [
                                  Text(
                                    'Opa! Você ainda não possui cartões de crédito cadastrados.',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.25,
                                        height: 1.4,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Column(
                                children: [
                                  Botao(
                                      label: 'Adicionar cartão',
                                      onPressed: () {})
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
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
