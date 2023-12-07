// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botaoPerfil.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.Primary50,
      appBar: AppBar(
        toolbarHeight: 310,
        backgroundColor: Cor.Primary400,
        title: Column(
          children: [
            Row(
              children: [Text('Perfil')],
            ),
            Container(
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BtnPerfil(
              titulo: 'Cadastro',
              icon: Icons.person_outline,
            ),
            BtnPerfil(
              titulo: 'Minhas economias',
              icon: Icons.attach_money_outlined,
            ),
            BtnPerfil(
              titulo: 'Convide um amigo',
              icon: Icons.link,
            ),
            BtnPerfil(
              titulo: 'Deletar conta',
              icon: Icons.close,
            )
          ],
        ),
      ),
    );
  }
}
