import 'package:flutter/material.dart';
import 'package:payment_app/features/check_out/presentation/widgets/custom_bloc_button_consumer.dart';
import 'package:payment_app/features/check_out/presentation/widgets/payment_method_list_view.dart';

class PaymentMethodBottomSheat extends StatefulWidget {
  const PaymentMethodBottomSheat({super.key});

  @override
  State<PaymentMethodBottomSheat> createState() =>
      _PaymentMethodBottomSheatState();
}

class _PaymentMethodBottomSheatState extends State<PaymentMethodBottomSheat> {
  int selectedPaymentMethodIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          PaymentMethodsListView(
            onPaymentMethodSelected: (index) {
              setState(() {
                selectedPaymentMethodIndex = index;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomBlocButtonConsumer(
            selectedPaymentMethodIndex: selectedPaymentMethodIndex,
          ),
        ],
      ),
    );
  }
}
