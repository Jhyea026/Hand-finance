// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:handfinance/util/nomes_fierebase.dart';
// import 'package:handfinance/util/nomes_fierebase.dart';

// Criando conta com email e senha
class AuthFirebase {
  Future<String> creatAccount(
      String email, String senha, Map<String, String> dadosPessoais) async {
    try {
      //crendecial
      UserCredential userUpdate = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: senha);
      //Adciona o nome do usuário no DisplayName
      await userUpdate.user!
          .updateDisplayName(dadosPessoais[NomesCamposFirebase.nome]);

      User? user = FirebaseAuth.instance.currentUser;
      //criando coleção com campo Saldo recebendo 0,0

      DocumentReference documentRefer =
          FirebaseFirestore.instance.collection('Conta').doc(user?.uid);

      documentRefer.set({
        'saldoTotal': 0,
      });

      // FirebaseFirestore.instance
      //     .collection('Conta')
      //     .doc(_user?.uid)
      //     .set({'saldoTotal': 0});

      // documentRefer
      //     .collection('Receitas')
      //     .doc()
      //     .set({'receitasTotal': 0, 'receitasDescrição': ''});

      // documentRefer
      //     .collection('Despesas')
      //     .doc()
      //     .set({'despesasTotal': 0, 'despesasDescrição': ''});

      // await _user?.updateDisplayName(dadosPessoais[NomesCamposFirebase.nome]);
      return 'OK';
    } catch (e) {
      throw "Erro ao tentar criar conta no Firebase Auth";
    }
  }

  static bool validarForm(Map<String, String> dados) {
    return dados.values
        .every((element) => element.toString().isNotEmpty && element != "null");
  }

  Future<String> loginAccount(String email, String senha) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: senha);
      return 'OK';
    } catch (e) {
      throw "Erro ao tentar criar conta no Firebase Auth";
    }
  }

  Future<void> lougt() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> deletAccount() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
    } catch (e) {
      throw 'Erro ao tenta apagar conta $e';
    }
  }
}
