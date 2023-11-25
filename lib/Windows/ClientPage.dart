// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Windows/Goals.dart';
import 'package:handfinance/Windows/Planning.dart';
import 'package:handfinance/Windows/Transactions.dart';
import 'package:handfinance/Windows/home.dart';

class ClientPage extends StatefulWidget {
  @override
  _MyClientPagePageState createState() => _MyClientPagePageState();
}

class _MyClientPagePageState extends State<ClientPage> {
  int _currentIndex = 0;
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
        toolbarHeight: 82,
        backgroundColor: Cor.Primary400,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            SizedBox(child: Image.asset('lib/Assets/HandFinance-Logo2.png')),
            IconButton(onPressed: () {}, icon: Icon(Icons.person))
          ],
        ),
      ),
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
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Cor.Primary700,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Cor.Primary700,
            ),
            label: 'Transações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Cor.Primary700),
            label: 'Planejamento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Cor.Primary700),
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
}
