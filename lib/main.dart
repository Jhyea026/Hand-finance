import 'package:flutter/material.dart';
import 'package:handfinance/Widgets/botao.dart';
import 'package:handfinance/Widgets/bottomSheet.dart';
import 'package:handfinance/Widgets/welcome.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hand Finance App',
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Cards(lis: [
                Botao(label: 'Cadastrar', onPressed: () {}),
                Botao(
                  label: 'Já possuo cadastro',
                  onPressed: () {},
                  style: false,
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
