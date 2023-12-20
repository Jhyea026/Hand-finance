// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/util/DB_Firebase.dart';

class Loading extends StatefulWidget {
  final String screen;

  const Loading({Key? key, required this.screen}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return FutureBuilder<double>(
          future: DB_Firebase().buscarSaldo(),
          // A função builder que retorna um widget filho
          builder: (context, snapshot) {
            // Se a Future<String> ainda está carregando, mostra um widget de progresso circular
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(
                color: Color.fromARGB(0, 255, 255, 255),
                value: 2,
              );
            }
            // Se a Future<String> foi concluída com sucesso, mostra o valor em um widget de texto
            else if (snapshot.hasData) {
              return Text(
                'R\$ ${snapshot.data!.toStringAsFixed(2).replaceAll('.', ',')}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: widget.screen == 'home'
                        ? FontWeight.w500
                        : FontWeight.normal,
                    color: widget.screen == 'home'
                        ? Color.fromARGB(255, 105, 105, 105)
                        : Cor.Primary50),
              );
            }
            // Se a Future<String> foi concluída com erro, mostra uma mensagem de erro em um widget de texto
            else if (snapshot.hasError) {
              return Text('Ocorreu um erro: ${snapshot.error}');
            }
            // Se a Future<String> foi concluída sem dados, mostra uma mensagem de vazio em um widget de texto
            else {
              return Text('Sem dados');
            }
          },
        );
      },
    );
  }
}
