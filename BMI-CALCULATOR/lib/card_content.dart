import 'package:flutter/material.dart';
import 'constants.dart';

class Cardcontent extends StatelessWidget {
  const Cardcontent({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 85.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: labelTextstyle,
        )
      ],
    );
  }
}
