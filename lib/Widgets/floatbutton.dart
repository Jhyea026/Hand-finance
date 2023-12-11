// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, unnecessary_new

import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:handfinance/Colors/cor.dart';
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
          title: "Despezas",
          iconColor: Colors.white,
          bubbleColor: Cor.Primary300,
          icon: Icons.trending_down_outlined,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
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
            // Navigator.push(
            //     context,
            //     new MaterialPageRoute(
            //         builder: (BuildContext context) => Home()));
            _animationController.reverse();
          },
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),

      // Floating Action button Icon color
      iconColor: Cor.Primary50,

      // Flaoting Action button Icon
      iconData: Icons.add,
      backGroundColor: Cor.Primary700,
    );
  }
}
