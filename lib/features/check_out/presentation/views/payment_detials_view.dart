import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_app_bar.dart';
import 'package:payment_app/features/check_out/presentation/widgets/payment_details_body.dart';

class PaymentDetialsView extends StatelessWidget {
  const PaymentDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
      body: const PaymentDetailsBody(),
    );
  }
}
