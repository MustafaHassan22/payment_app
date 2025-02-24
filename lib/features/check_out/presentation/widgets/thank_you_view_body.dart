import 'package:flutter/material.dart';
import 'package:payment_app/features/check_out/presentation/widgets/custom_check_out.dart';
import 'package:payment_app/features/check_out/presentation/widgets/custom_circale_avatar.dart';
import 'package:payment_app/features/check_out/presentation/widgets/custom_dashed_line.dart';
import 'package:payment_app/features/check_out/presentation/widgets/thak_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // final bottomOffset = MediaQuery.of(context).size.height * .2;
    const circleRadius = 20.0;
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),
          CustomContainer(
            circleRadius: circleRadius,
            isLeft: true,
          ),
          CustomContainer(
            circleRadius: circleRadius,
            isLeft: false,
          ),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckOut(),
          ),
          CustomDashedLine(),
          // CustomDashedLineTwo(
          //     circleRadius: circleRadius, bottomOffset: bottomOffset),
        ],
      ),
    );
  }
}
