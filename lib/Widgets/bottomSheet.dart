import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  List<Widget> lis;
  double altura, largura;

  Cards({super.key, required this.lis, this.altura = 400, this.largura = 369});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 6, right: 6),
      child: Column(
        children: lis,
      ),
    );
  }
}
