import 'package:flutter/material.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 23,
      right: 23,
      bottom: MediaQuery.of(context).size.height * .2 + 20,
      child: Row(
        children: List.generate(
          20,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Container(
                height: 2,
                color: const Color(0xffB8B8B8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
