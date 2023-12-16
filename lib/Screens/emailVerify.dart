// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';
import 'package:handfinance/Widgets/bottomSheet.dart';

class emailVerify extends StatelessWidget {
  const emailVerify({super.key});

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
                'Verifique seu email',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 62, right: 62),
                child: Text(
                  'Enviamos instruções de redefinição de senha para:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 56, right: 56),
                child: Text(
                  'Example@example.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Cor.Primary800),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Botao(
                        label: 'Não recebeu? Reenviar email',
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (context) {
                          //     return loginCreateAccount();
                          //   }),
                          // );
                        }),
                    Botao(
                      label: 'Trocar email',
                      onPressed: () {
                        Navigator.pop(context);
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
