// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, unnecessary_new

import 'dart:ui';

import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
import 'package:handfinance/Screens/addProfit.dart';
// import 'package:handfinance/Windows/home.dart';

class MyFloatButton extends StatefulWidget {
  MyFloatButton({
    super.key,
  });

  @override
  _MyFloatButtonState createState() => _MyFloatButtonState();
}

class _MyFloatButtonState extends State<MyFloatButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  bool isOpened = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: "Transferências",
          iconColor: Colors.white,
          bubbleColor: Cor.Primary300,
          icon: Icons.repeat_outlined,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
          },
        ),
        // Floating action menu item
        Bubble(
          title: "Despesas",
          iconColor: Colors.white,
          bubbleColor: Cor.Primary300,
          icon: Icons.trending_down_outlined,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => addProfit(
                          option: 'Despesas',
                        )));
            _animationController.forward();
          },
        ),
        //Floating action menu item
        Bubble(
          title: "Receitas",
          iconColor: Colors.white,
          bubbleColor: Cor.Primary300,
          icon: Icons.trending_up_outlined,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => addProfit(
                          option: 'Receitas',
                        )));
            _animationController.forward();
          },
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () {
        _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward();
        setState(() {
          isOpened = !isOpened;
        });
      },

      // Floating Action button Icon color
      iconColor: Cor.Primary50,

      // Flaoting Action button Icon
      iconData: isOpened ? Icons.add : Icons.close_outlined,
      backGroundColor: Cor.Primary700,
    );
  }
}
