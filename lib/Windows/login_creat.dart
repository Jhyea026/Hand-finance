// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';
import 'package:handfinance/Widgets/bottomSheet.dart';
import 'package:handfinance/Widgets/textField.dart';
import 'package:handfinance/Windows/login.dart';

class loginCreateAccount extends StatefulWidget {
  const loginCreateAccount({super.key});

  @override
  State<loginCreateAccount> createState() => _loginCreateAccountState();
}

class _loginCreateAccountState extends State<loginCreateAccount> {
  double alturaSizebox = 25;
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confSenhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.Primary50,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Image.asset('lib/Assets/HandFinance-Logo.png'),
                      ],
                    )),
                Cards(
                  lis: [
                    Padding(
                      padding: EdgeInsets.only(left: 62, right: 62, top: 20),
                      child: Column(
                        children: [
                          Text(
                            'Faça seu cadastro.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 121, 116, 126)),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          myTextField(
                            labText: 'Nome',
                            controller: nomeController,
                          ),
                          SizedBox(
                            height: alturaSizebox,
                          ),
                          myTextField(
                            labText: 'Email',
                            controller: emailController,
                          ),
                          SizedBox(
                            height: alturaSizebox,
                          ),
                          myTextField(
                            labText: 'Senha',
                            controller: senhaController,
                            password: true,
                          ),
                          SizedBox(
                            height: alturaSizebox,
                          ),
                          myTextField(
                            labText: 'Confirme a senha',
                            controller: confSenhaController,
                            password: true,
                          ),
                          SizedBox(
                            height: alturaSizebox,
                          ),
                          Botao(
                            label: 'Concordar e continuar',
                            onPressed: () {},
                            style: true,
                            largura: 300,
                          ),
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
                            largura: 300,
                          ),
                          SizedBox(
                            height: alturaSizebox - 20,
                          ),
                          Text(
                            'Ao continuar, estou de acordo com os Termos de uso e com o Aviso de Privacidade do Hand Finance.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 121, 116, 126)),
                          ),
                        ],
                      ),
                    ),
                  ],
                  altura: 580,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
