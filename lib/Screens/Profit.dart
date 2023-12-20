// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/card.dart';
import 'package:handfinance/Widgets/loading.dart';
import 'package:handfinance/util/DB_Firebase.dart';
import 'package:handfinance/util/models.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  List<DB_Models> models = [];
  User? user = FirebaseAuth.instance.currentUser;
  double totalReceitas = 0;
  double saldoAtual = 0;

  Future<void> buscarDados(String colecao) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? dadosColecao =
          await DB_Firebase().receberDados(user!.uid, colecao);
      setState(() {
        models = dadosColecao!.docs
            .where((doc) => doc.data().isNotEmpty)
            .map((itens) {
          Map<String, dynamic> item = itens.data();
          totalReceitas += item['${colecao.toLowerCase()}Valor'];

          return DB_Models(
              descricao: item['${colecao.toLowerCase()}Descrição'],
              valor: item['${colecao.toLowerCase()}Valor']
                  .toStringAsFixed(2)
                  .replaceAll('.', ','));
        }).toList();
      });
    } catch (e) {
      throw "Error ao tentar acessar dados $e";
    }
  }

  @override
  void initState() {
    super.initState();
    buscarDados('Receitas');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cor.Primary50,
        body: Stack(
          children: [
            models.isEmpty
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
                      children: models.map((data) {
                        return HomeCards(
                          titulo: 'Receita',
                          conteudo: [
                            Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  data.descricao,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 105, 105, 105),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('lib/Assets/Win.png'),
                                    SizedBox(width: 2),
                                    Text(
                                      'R\$ ${data.valor}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        );
                      }).toList(),
                    )),
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
                        Loading(screen: 'screen')
                        // Text("R\$ 0,00",
                        //     style: TextStyle(color: Cor.Primary50)),
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
                          'Total de receitas',
                          style: TextStyle(color: Cor.Primary50),
                        ),
                        Text(
                            "R\$ ${totalReceitas.toStringAsFixed(2).replaceAll('.', ',')}",
                            style: TextStyle(color: Cor.Primary50)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
