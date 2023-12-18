// ignore_for_file: file_names, camel_case_types,

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DB_Firebase {
  User? user = FirebaseAuth.instance.currentUser!;

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

  Future<double> somaValores(String colecao) async {
    double total = 0;

    QuerySnapshot<Map<String, dynamic>>? dadosColecao =
        await DB_Firebase().receberDados(user!.uid, colecao);

    try {
      if (dadosColecao != null) {
        dynamic teste;
        teste = dadosColecao.docs
            .where((doc) => doc.data().isNotEmpty)
            .map((itens) {
          Map<String, dynamic> item = itens.data();

          total = total + item['${colecao.toLowerCase()}Valor'];
        });

        return total;
      } else {
        return 0;
      }
    } catch (e) {
      throw "Error ao tentar acessar dados $e";
    }
  }
}
