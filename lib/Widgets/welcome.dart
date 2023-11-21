import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/botao.dart';
import 'package:handfinance/Widgets/bottomSheet.dart';

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
            children:[
              
              Image.asset('lib/Assets/HandFinance-Logo.png'),
              SizedBox(height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.4),
              Cards(lis: [
                Text('Seja bem vindo !', style: TextStyle(fontSize: 22),),
                Container(
                  child: Column(
                    children: [
                      Botao(label: 'Cadastrar', onPressed: () {}),
                      Botao(
                        label: 'Já possuo cadastro',
                        onPressed: () {},
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
