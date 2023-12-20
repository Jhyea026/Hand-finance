// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';
import 'package:handfinance/Widgets/card.dart';
import 'package:handfinance/Widgets/loading.dart';
import 'package:handfinance/util/DB_Firebase.dart';
import 'package:handfinance/util/models.dart';
import 'package:handfinance/util/nomes_fierebase.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser!;
  dynamic saldo;
  List<DB_Models> models = [];
  double totalDespesas = 0;
  late bool colecaoSelect;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    buscarDados('Despesas');
  }

  Future<void> buscarDados(String colecao) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? dadosColecao =
          await DB_Firebase().receberDados(user!.uid, colecao);
      setState(() {
        models = dadosColecao!.docs
            .where((doc) => doc.data().isNotEmpty)
            .map((itens) {
          Map<String, dynamic> item = itens.data();
          totalDespesas += item['${colecao.toLowerCase()}Valor'];

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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cor.Primary50,
        body: RefreshIndicator(
          onRefresh: DB_Firebase().buscarSaldo,
          child: SingleChildScrollView(
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
                                          color: Color.fromARGB(
                                              255, 105, 105, 105)),
                                    ),
                                    Loading(screen: 'home'),
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
                                              'R\$ ${totalDespesas.toStringAsFixed(2).replaceAll('.', ',')}',
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
                                              'Receitas',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 105, 105, 105)),
                                            ),
                                            Text(
                                              'R\$ 0,00',
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
                          padding:
                              EdgeInsets.only(top: 10, left: 19, right: 19),
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset('lib/Assets/Credit_card.png'),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Opa! Você ainda não possui cartões de crédito cadastrados.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.25,
                                            height: 1.4,
                                            color: Color.fromARGB(
                                                255, 105, 105, 105)),
                                      ),
                                    ],
                                  ),
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
                      conteudo: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          child: Column(
                            children: [
                              Text(
                                'Opa! Você ainda não possui cartões de crédito cadastrados.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.25,
                                    height: 1.4,
                                    color: Color.fromARGB(255, 105, 105, 105)),
                              ),
                            ],
                          ),
                        ),
                        Botao(label: 'Criar um planejamento', onPressed: () {})
                      ],
                    ),
                    HomeCards(
                      titulo: 'Economia mensal',
                      conteudo: [
                        Container(
                            padding:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        width: 160,
                                        height: 67,
                                        child: Text(
                                          'Você ainda não tem nenhum registro para este mês.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.25,
                                              height: 1.3,
                                              color: Color.fromARGB(
                                                  255, 105, 105, 105)),
                                        )),
                                    Container(
                                        width: 130,
                                        height: 67,
                                        child: Text(
                                          'Você economizou 0.00% dos seus ganhos.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.15,
                                              height: 1.3,
                                              color: Color.fromARGB(
                                                  255, 105, 105, 105)),
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Image.asset('lib/Assets/Star.png'),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          width: 210,
                                          child: Text(
                                            'Pense bem nas próximas despesas e reveja suas metas',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.15,
                                                height: 1.3,
                                                color: Color.fromARGB(
                                                    255, 105, 105, 105)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
