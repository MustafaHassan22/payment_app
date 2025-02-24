import 'package:flutter/material.dart';

class CustomDashedLineTwo extends StatelessWidget {
  const CustomDashedLineTwo({
    super.key,
    required this.circleRadius,
    required this.bottomOffset,
  });

  final double circleRadius;
  final double bottomOffset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: circleRadius + 4,
      right: circleRadius + 4,
      bottom: bottomOffset + circleRadius / 1,
      child: const MySeparator(
        color: Colors.grey,
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({super.key, this.height = 2, this.color = Colors.black});
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
