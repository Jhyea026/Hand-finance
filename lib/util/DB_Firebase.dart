// ignore_for_file: file_names, camel_case_types,, unused_local_variable

import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:handfinance/util/models.dart';

class DB_Firebase {
  User? user = FirebaseAuth.instance.currentUser!;

  double totalReceitas = 0;
  double totalDespesas = 0;

  Future<bool> addDB(String colecao, String descricao, double valor) async {
    try {
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection('Conta')
          .doc(user?.uid)
          .collection(colecao);

      collectionReference.add({
        "${colecao.toLowerCase()}Valor": valor,
        "${colecao.toLowerCase()}Descrição": descricao
      });

      return true;
    } on Exception catch (e) {
      throw 'Erro ao receber dados da coleção "$colecao": $e';
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> receberDados(
      String userId, String colecao) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      return await firestore
          .collection('Conta')
          .doc(userId)
          .collection(colecao)
          .get();
    } catch (e) {
      throw 'Erro ao receber dados da coleção "$colecao": $e';
    }
  }

  Future<void> atualizarSaldo() async {
    List<double> despesas = [];
    List<double> receitas = [];

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>>? dadosReceitas =
          await DB_Firebase().receberDados(user!.uid, 'Receitas');
      QuerySnapshot<Map<String, dynamic>>? dadosDespesas =
          await DB_Firebase().receberDados(user!.uid, 'Despesas');
      receitas = dadosReceitas!.docs
          .where((doc) => doc.data().isNotEmpty)
          .map((itens) {
        Map<String, dynamic> item = itens.data();
        totalReceitas += item['receitasValor'];
        return totalReceitas;
      }).toList();

      despesas = dadosDespesas!.docs
          .where((doc) => doc.data().isNotEmpty)
          .map((itens) {
        Map<String, dynamic> item = itens.data();
        totalDespesas += item['despesasValor'];
        return totalDespesas;
      }).toList();

      double saldoTotal = totalReceitas - totalDespesas;

      await firestore
          .collection('Conta')
          .doc(user!.uid)
          .update({'saldoTotal': saldoTotal});
    } on Exception catch (e) {
      throw 'Error ao somar saldo total';
    }
  }

  Future<double> buscarSaldo() async {
    dynamic saldo;

    DocumentReference lerdados =
        FirebaseFirestore.instance.collection('Conta').doc(user?.uid);
    DocumentSnapshot pegarDados = await lerdados.get();

    if (pegarDados.exists) {
      Map<String, dynamic> data = pegarDados.data() as Map<String, dynamic>;

      saldo = data['saldoTotal'].toDouble();
      return saldo;
    } else {
      return 0;
    }
  }
}
