// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';
import 'package:handfinance/Widgets/bottomSheet.dart';
import 'package:handfinance/Widgets/textField.dart';
import 'package:handfinance/Windows/emailVerify.dart';

class forgotPassword extends StatelessWidget {
  const forgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Cor.Primary50,
      body: GestureDetector(
        onTap: () {
          // Fecha o teclado quando toca fora do campo de texto
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.164,
              ),
              Image.asset('lib/Assets/HandFinance-Logo.png'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Cards(lis: [
                SizedBox(
                  height: 0,
                ),
                Text(
                  'Esqueceu sua senha ?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 62, right: 62),
                  child: Text(
                    'Digite seu email para que possamos recuperá-la para você.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 62, right: 62),
                  child: myTextField(
                    labText: 'Email',
                    controller: emailController,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Botao(
                          label: 'Redefinir',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return emailVerify();
                              }),
                            );
                          }),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
