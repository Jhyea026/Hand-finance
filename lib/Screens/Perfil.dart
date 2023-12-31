// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Screens/welcome.dart';
import 'package:handfinance/Widgets/botaoPerfil.dart';
import 'package:handfinance/util/authen_firebase.dart';

class Perfil extends StatelessWidget {
  Perfil({super.key});
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.Primary50,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Cor.Primary50),
        toolbarHeight: 70,
        backgroundColor: Cor.Primary400,
        centerTitle: true,
        title: Text(
          'Perfil',
          style: TextStyle(color: Cor.Primary50),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 40),
            padding: EdgeInsets.only(top: 10, bottom: 27),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Cor.Primary400,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.edit_outlined),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Cor.Primary700),
                            iconColor: MaterialStatePropertyAll(Cor.Primary50)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${user!.displayName}',
                  style: TextStyle(fontSize: 22, color: Cor.Primary50),
                ),
                Text('${user!.email}',
                    style: TextStyle(fontSize: 14, color: Cor.Primary50))
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnPerfil(
                  acao: () {},
                  titulo: 'Cadastro',
                  icon: Icons.person_outline,
                ),
                BtnPerfil(
                  acao: () {},
                  titulo: 'Minhas economias',
                  icon: Icons.attach_money_outlined,
                ),
                BtnPerfil(
                  acao: () {},
                  titulo: 'Convide um amigo',
                  icon: Icons.link,
                ),
                BtnPerfil(
                  acao: () {
                    AuthFirebase().deletAccount();
                    print('Usuario deletado');
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Welcome()),
                        (route) => false);
                  },
                  titulo: 'Deletar conta',
                  icon: Icons.close,
                  colorRed: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
