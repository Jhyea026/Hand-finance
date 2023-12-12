import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:handfinance/util/nomes_fierebase.dart';

// Criando conta com email e senha
class AuthFirebase {
  Future<String> creatAccount(
      String email, String senha, Map<String, String> dadosPessoais) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: senha);
      User? user = FirebaseAuth.instance.currentUser;
      dadosPessoais.remove(NomesCamposFirebase.email);

      await FirebaseFirestore.instance
          .collection(NomesColecaoFirebase.colecaoRaiz)
          .doc(user?.uid)
          .set(dadosPessoais);
      return 'OK';
    } catch (e) {
      throw "Erro ao tentar criar conta no Firebase Auth";
    }
  }

  static bool validarForm(Map<String, String> dados) {
    return dados.values.every((element) =>
        element != null && element.toString().isNotEmpty && element != "null");
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
}
