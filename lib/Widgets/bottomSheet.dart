// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  List<Widget> lis;
  double altura;

  Cards({super.key, required this.lis, this.altura = 350});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.99,
        height: altura,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: Color.fromARGB(
              255,
              255,
              255,
              255,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ]),
        margin: EdgeInsets.only(left: 6, right: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: lis,
        ));
  }
}
