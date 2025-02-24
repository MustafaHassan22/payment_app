import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.circleRadius,
    required this.isLeft, // New parameter to determine position
  });

  final double circleRadius;
  final bool isLeft; // true -> left, false -> right

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: isLeft ? -circleRadius : null,
      right: isLeft ? null : -circleRadius,
      bottom: MediaQuery.of(context).size.height * .2,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
