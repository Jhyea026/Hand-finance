// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';
import 'package:handfinance/Widgets/card.dart';

class Planning extends StatefulWidget {
  const Planning({super.key});

  @override
  State<Planning> createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ooops!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 63, 63, 63)),
                          ),
                          Text(
                            'Nenhuma despesa para mostar :(',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 63, 63, 63)),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: ListView(
                      children: [
                        HomeCards(titulo: 'Despesas', conteudo: [
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Text('Descrição',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 105, 105, 105))),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/Assets/Loss.png'),
                                  SizedBox(width: 2),
                                  Text(
                                    'R\$ 0,00',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105)),
                                  )
                                ],
                              )
                            ],
                          )
                        ]),
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
                      width: 30,
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
                        Text('R\$ 0,00', style: TextStyle(color: Cor.Primary50))
                      ],
                    ),
                    SizedBox(width: 70),
                    Icon(
                      Icons.attach_money,
                      size: 32,
                      color: Cor.Primary50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total de despesas',
                          style: TextStyle(color: Cor.Primary50),
                        ),
                        Text("R\$ 0,00",
                            style: TextStyle(color: Cor.Primary50)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
