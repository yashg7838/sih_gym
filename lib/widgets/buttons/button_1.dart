import 'package:flutter/material.dart';

class button_1 extends StatelessWidget {
  final double btn_width;
  final Color btn_color;
  final String btn_text;

  button_1({super.key,
    required this.btn_width,
    required this.btn_color,
    required this.btn_text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btn_width,
      height: 50,
      decoration: BoxDecoration(
        color: btn_color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
          child: Text(
              btn_text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          )),
    );
  }
}
