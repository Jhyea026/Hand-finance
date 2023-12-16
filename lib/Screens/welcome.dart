// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';
import 'package:handfinance/Widgets/bottomSheet.dart';
import 'package:handfinance/Screens/login.dart';
import 'package:handfinance/Screens/login_creat.dart';

// ignore: camel_case_types
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.Primary50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('lib/Assets/HandFinance-Logo.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            Cards(lis: [
              Text(
                'Seja bem vindo !',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 62, right: 62),
                child: Text(
                  'Tenha um controle da sua vida financeira na palma da sua mão.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 62, right: 62),
                child: Text(
                  'Cadastre-se, crie planejamentos, controle todos os seus gastos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Botao(
                        label: 'Cadastrar',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return loginCreateAccount();
                            }),
                          );
                        }),
                    Botao(
                      label: 'Já sou cadastrado',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return Login();
                          }),
                        );
                      },
                      style: false,
                    ),
                  ],
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
