// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:email_validator_flutter/email_validator_flutter.dart';
import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';
import 'package:handfinance/Widgets/bottomSheet.dart';
import 'package:handfinance/Widgets/textField.dart';
import 'package:handfinance/Screens/ClientPage.dart';
import 'package:handfinance/Screens/emailVerify.dart';
import 'package:handfinance/Screens/forgotPassword.dart';
// import 'package:handfinance/Windows/home.dart';
import 'package:handfinance/Screens/login_creat.dart';
import 'package:handfinance/util/authen_firebase.dart';
import 'package:validadores/ValidarEmail.dart';

class Login extends StatelessWidget {
  Login({super.key});

  double alturaSizebox = 25;
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void mudarTela() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return ClientPage();
        }),
      );
    }

    void login(String email, String senha) async {
      String validarLogin = await AuthFirebase().loginAccount(email, senha);
      Map<String, String> dados = {email: email, senha: senha};

      if (AuthFirebase.validarForm(dados) && validarLogin == 'OK') {
        print("Authe");
        // // EmailValidatorFlutter().validateEmail(email)
        mudarTela();
      }
    }

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
                    SizedBox(
                      height: 500,
                      width: 310,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Acompanhe a evolução mensal dos seus gastos e domine suas finanças.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 121, 116, 126)),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: Text(
                              'Faça seu login e comece agora a organizar sua vida.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45),
                            ),
                          ),
                          SizedBox(
                            height: alturaSizebox,
                          ),
                          myTextField(
                            labText: 'Email',
                            controller: emailController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          myTextField(
                            labText: 'Senha',
                            controller: senhaController,
                            password: true,
                            isVisible: true,
                          ),
                          SizedBox(
                            height: alturaSizebox,
                          ),
                          Botao(
                            label: 'Entrar',
                            onPressed: () {
                              login(emailController.text, senhaController.text);
                            },
                            style: true,
                          ),
                          Botao(
                            label: 'Criar conta',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return loginCreateAccount();
                                }),
                              );
                            },
                            style: false,
                          ),
                          Text(
                            'Entrar com:',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
                          ),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      print("Facebook");
                                    },
                                    child:
                                        Image.asset('lib/Assets/Facebook.png')),
                                GestureDetector(
                                    onTap: () {
                                      print("Google");
                                    },
                                    child: Image.asset('lib/Assets/Google.png'))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return forgotPassword();
                                }),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: 'Esqueceu sua senha? ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 121, 116, 126)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Redefina a senha.',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Cor.Primary700))
                                  ]),
                            ),
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
