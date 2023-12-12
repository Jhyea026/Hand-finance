import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:handfinance/Colors/cor.dart';
// import 'package:handfinance/Widgets/Menu.dart';
// import 'package:handfinance/Widgets/botao.dart';
// import 'package:handfinance/Widgets/bottomSheet.dart';
// import 'package:handfinance/Windows/emailVerify.dart';
// import 'package:handfinance/Windows/forgotPassword.dart';
// import 'package:handfinance/Windows/ClientPage.dart';
// import 'package:handfinance/Windows/login.dart';
// import 'package:handfinance/Windows/login_creat.dart';
import 'package:handfinance/Windows/welcome.dart';
import 'package:handfinance/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    print("firebase Iniciado");
  } catch (e) {
    throw "Falha ao Inicializar o Firebase $e";
  }
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
