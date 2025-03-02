import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/check_out/presentation/views/thank_you_view.dart';
import 'package:payment_app/features/check_out/presentation/widgets/custom_credit_card.dart';
import 'package:payment_app/features/check_out/presentation/widgets/payment_method_list_view.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // const PaymentMethodsListView(),
                CustomCreditCart(
                  formKey: formKey,
                  autovalidateMode: autovalidateMode,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
          child: CustomButton(
            title: 'Payment',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const ThankYouView();
                    },
                  ),
                );
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }
}
