import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class TotalInfo extends StatelessWidget {
  const TotalInfo({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.style25,
        ),
        Text(
          value,
          style: Styles.style25,
        )
      ],
    );
  }
}
