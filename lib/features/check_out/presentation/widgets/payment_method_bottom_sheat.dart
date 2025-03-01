import 'package:flutter/material.dart';
import 'package:payment_app/features/check_out/presentation/widgets/custom_bloc_button_consumer.dart';
import 'package:payment_app/features/check_out/presentation/widgets/payment_method_list_view.dart';

class PaymentMethodBottomSheat extends StatelessWidget {
  const PaymentMethodBottomSheat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          PaymentMethodsListView(),
          SizedBox(
            height: 20,
          ),
          CustomBlocButtonConsumer(),
        ],
      ),
    );
  }
}
