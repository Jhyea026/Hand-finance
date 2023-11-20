import 'package:flutter/material.dart';

// ignore: camel_case_types
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

Future displayBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            height: 369,
          ));
}
