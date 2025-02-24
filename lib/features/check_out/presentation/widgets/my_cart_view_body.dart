import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/check_out/presentation/views/payment_detials_view.dart';
import 'package:payment_app/features/check_out/presentation/widgets/order_info_item.dart';
import 'package:payment_app/features/check_out/presentation/widgets/payment_method_list_view.dart';
import 'package:payment_app/features/check_out/presentation/widgets/total_into_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Expanded(child: Image.asset('assets/images/basket.png')),
          const SizedBox(
            height: 12,
          ),
          const OrderInfoItem(
            titel: 'order Subtotal',
            value: r'$42.97',
          ),
          const OrderInfoItem(
            titel: 'discont',
            value: r'$0',
          ),
          const OrderInfoItem(
            titel: 'Shipping',
            value: r'$8',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Divider(
              height: 30,
              thickness: 2,
            ),
          ),
          const TotalInfo(
            title: 'Total',
            value: r'$50.97',
          ),
          const SizedBox(
            height: 12,
          ),
          CustomButton(
            title: 'Complete Payment',
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const PaymentDetialsView();
              //     },
              //   ),
              // );

              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return PaymentMethodBottomSheat();
                  });
            },
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}

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
          CustomButton(title: 'Continue'),
        ],
      ),
    );
  }
}
