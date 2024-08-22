import 'package:flutter/material.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 1,
      width: double.infinity,
      margin: const EdgeInsetsDirectional.symmetric(vertical: 20),
    );
  }
}
