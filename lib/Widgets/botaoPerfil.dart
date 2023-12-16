// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';

class BtnPerfil extends StatelessWidget {
  String titulo;
  IconData icon;
  bool colorRed;
  VoidCallback acao;
  BtnPerfil(
      {super.key,
      required this.titulo,
      required this.icon,
      required this.acao,
      this.colorRed = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: acao,
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 26, left: 26),
        padding: EdgeInsets.only(bottom: 10, top: 10, left: 20),
        width: 300,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Color.fromARGB(255, 191, 191, 191))),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: [
              Container(
                child: Icon(
                  icon,
                  size: 30,
                  color: colorRed
                      ? Color.fromARGB(255, 180, 24, 16)
                      : Color.fromARGB(255, 82, 82, 82),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  titulo,
                  style: TextStyle(
                      fontSize: 17,
                      color: colorRed
                          ? Color.fromARGB(255, 180, 24, 16)
                          : Color.fromARGB(255, 82, 82, 82)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
