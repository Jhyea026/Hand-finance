import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';

// ignore: must_be_immutable
class Botao extends StatelessWidget {
  String label;
  double altura;
  double largura;
  bool style;
  VoidCallback onPressed;
  Botao(
      {super.key,
      required this.label,
      required this.onPressed,
      this.style = true,
      this.altura = 40,
      this.largura = 186});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(largura, altura)),
            // ignore: prefer_const_constructors
            backgroundColor: style
                ? MaterialStatePropertyAll(Cor.Primary700)
                : MaterialStatePropertyAll(const Color.fromARGB(0, 0, 0, 0))),
        child: Text(
          label,
          style: TextStyle(color: style ? Cor.Primary50 : Cor.Primary700),
        ));
  }
}
