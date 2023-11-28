// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeCards extends StatefulWidget {
  String titulo;
  List<Widget> conteudo;
  double altura;
  HomeCards(
      {super.key,
      required this.titulo,
      required this.conteudo,
      this.altura = 159});

  @override
  State<HomeCards> createState() => _CardsState();
}

class _CardsState extends State<HomeCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 26, left: 26),
      padding: EdgeInsets.only(bottom: 10),
      width: 360,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color.fromARGB(255, 191, 191, 191))),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text(
              widget.titulo,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Column(
              children: widget.conteudo,
            )
          ],
        ),
      ),
    );
  }
}
