// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/bottomSheet.dart';
import 'package:handfinance/Widgets/textField.dart';
import 'package:handfinance/util/DB_Firebase.dart';

class addProfit extends StatefulWidget {
  final String option;
  const addProfit({super.key, required this.option});

  @override
  State<addProfit> createState() => _addProfitState();
}

class _addProfitState extends State<addProfit> {
  late String option;
  TextEditingController descriptionController = TextEditingController(),
      valor = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      option = widget.option;
    });
  }

  void addDB(String colecao, double valor, String descricao) async {
    try {
      DB_Firebase().addDB(colecao, descricao, valor);
    } catch (e) {
      throw 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.Primary50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(18, 0, 0, 100),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 26,
                  ),
                  Text(
                    'Voltar',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          option == 'Receitas'
              ? Container(
                  width: 300,
                  child: Text(
                    'Adicione uma receita à sua carteira',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 63, 63, 63), fontSize: 22),
                  ),
                )
              : Container(
                  width: 300,
                  child: Text(
                    'Adicione uma despesa à sua carteira',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 63, 63, 63), fontSize: 22),
                  ),
                ),
          SizedBox(height: 140),
          Cards(altura: 450, lis: [
            DropdownButton<String>(
              style: TextStyle(
                  color: option == 'Receitas'
                      ? Cor.Primary700
                      : Color.fromARGB(255, 163, 74, 70),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              value: option,
              onChanged: (String? newValue) {
                setState(() {
                  option = newValue!;
                });
              },
              items: <String>['Despesas', 'Receitas']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        color: value == 'Receitas'
                            ? Cor.Primary700
                            : Color.fromARGB(255, 163, 74, 70)),
                  ),
                );
              }).toList(),
            ),
            option == 'Receitas'
                ? Container(
                    // Renderiza Receitas
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Valor',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Cor.Primary700),
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  child: TextField(
                                    controller: valor,
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    style: TextStyle(
                                        fontSize: 36,
                                        color:
                                            Color.fromARGB(255, 161, 161, 161)),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        hintText: 'R\$ 0,00',
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        myTextField(
                          controller: descriptionController,
                          labText: 'Descrição',
                          password: false,
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        IconButton(
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(16)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Cor.Primary700),
                                iconColor:
                                    MaterialStatePropertyAll(Cor.Primary50)),
                            iconSize: 30,
                            onPressed: () {
                              addDB('Receitas', double.parse(valor.text),
                                  descriptionController.text);
                              valor.text = '';
                              descriptionController.text = '';
                            },
                            icon: Icon(Icons.check_outlined))
                      ],
                    ),
                  )
                : Container(
                    // Renderiza despesas
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Valor',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 163, 74, 70)),
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  child: TextField(
                                    controller: valor,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 36,
                                        color:
                                            Color.fromARGB(255, 161, 161, 161)),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        hintText: 'R\$ 0,00',
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        myTextField(
                          controller: descriptionController,
                          labText: 'Descrição',
                          password: false,
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        IconButton(
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(16)),
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 163, 74, 70)),
                                iconColor:
                                    MaterialStatePropertyAll(Cor.Primary50)),
                            iconSize: 30,
                            onPressed: () {
                              addDB('Despesas', double.parse(valor.text),
                                  descriptionController.text);
                              valor.text = '';
                              descriptionController.text = '';
                            },
                            icon: Icon(Icons.check_outlined))
                      ],
                    ),
                  )
          ]),
        ],
      ),
    );
  }
}
