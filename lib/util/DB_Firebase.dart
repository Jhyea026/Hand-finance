// ignore_for_file: file_names, camel_case_types, unused_local_variable, unused_catch_clause

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
      return false;
    }
  }
}
