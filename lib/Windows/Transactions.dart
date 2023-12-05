// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cor.Primary50,
        body: Center(
            child: Container(
          width: 312,
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ops, você não possui transações registradas.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22, color: Color.fromARGB(255, 63, 63, 63)),
              ),
              Text(
                'Adicione suas transações para o mês atual usandoo botão (+).',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 105, 105, 105), fontSize: 14),
              )
            ],
          ),
        )));
  }
}
