// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_unnecessary_containers, sort_child_properties_last, unused_field, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Widgets/floatbutton.dart';
import 'package:handfinance/Windows/Goals.dart';
import 'package:handfinance/Windows/Perfil.dart';
import 'package:handfinance/Windows/Planning.dart';
import 'package:handfinance/Windows/Transactions.dart';
import 'package:handfinance/Windows/home.dart';
import 'package:handfinance/main.dart';
import 'package:handfinance/util/authen_firebase.dart';

class ClientPage extends StatefulWidget {
  @override
  _MyClientPagePageState createState() => _MyClientPagePageState();
}

class _MyClientPagePageState extends State<ClientPage> {
  int _currentIndex = 0;
  bool visible = false;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        automaticallyImplyLeading: false,
        toolbarHeight: 82,
        backgroundColor: Cor.Primary400,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopupMenuButton<String>(
                  position: PopupMenuPosition.under,
                  icon: Icon(
                    Icons.menu,
                    color: Cor.Primary50,
                  ),
                  onSelected: (value) {
                    // Navegar para a tela correspondente ao item selecionado
                    navigateToScreen(context, value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'item1',
                        child: Text('Carteira'),
                      ),
                      PopupMenuItem<String>(
                        value: 'item2',
                        child: Text('Lembrete diário'),
                      ),
                      PopupMenuItem<String>(
                        value: 'item3',
                        child: Text('Configurações'),
                      ),
                      PopupMenuItem<String>(
                        value: 'item4',
                        child: Text('Sobre'),
                      ),
                      PopupMenuItem<String>(
                        value: 'item5',
                        child: Text('Sair'),
                      ),
                    ];
                  },
                ),
                SizedBox(
                    child: Image.asset('lib/Assets/HandFinance-Logo2.png')),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return Perfil();
                        }),
                      );
                    },
                    icon: Icon(
                      Icons.person,
                      color: Cor.Primary50,
                    ))
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: MyFloatButton(),
      body: PageView(
        controller: _pageController,
        children: [
          Home(),
          Transactions(),
          Planning(),
          Goals(),
          // Adicione mais telas conforme necessário
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Cor.Primary700,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('lib/Assets/Home.png'), label: 'Principal'),
          BottomNavigationBarItem(
            icon: Image.asset('lib/Assets/Transactions.png'),
            label: 'Transações',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('lib/Assets/Planning.png'),
            label: 'Planejamento',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('lib/Assets/Goals.png'),
            label: 'Objetivo',
          ),
          // Adicione mais BottomNavigationBarItems conforme necessário
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }

  void navigateToScreen(BuildContext context, String value) {
    switch (value) {
      case 'item1':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Perfil()),
        );
        break;
      case 'item2':
        AuthFirebase().lougt();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Main()),
        );
        break;
      default:
        break;
    }
  }
}
