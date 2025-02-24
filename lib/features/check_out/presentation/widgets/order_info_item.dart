import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  final String titel, value;

  const OrderInfoItem({super.key, required this.titel, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titel,
            textAlign: TextAlign.center,
            style: Styles.style18,
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: Styles.style18,
          ),
        ],
      ),
    );
  }
}
