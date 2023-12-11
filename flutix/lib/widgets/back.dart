import 'package:flutter/material.dart';

class Arrow_Back extends StatelessWidget {
  const Arrow_Back({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: GestureDetector(
        child: Icon(
          Icons.keyboard_double_arrow_left_outlined,
          color: Color.fromARGB(255, 180, 212, 41),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
