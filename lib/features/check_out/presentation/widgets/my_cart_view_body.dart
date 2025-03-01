import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/check_out/data/repo/check_out_repo_impl.dart';
import 'package:payment_app/features/check_out/presentation/cubit/cubit/check_out_cubit_cubit.dart';
import 'package:payment_app/features/check_out/presentation/widgets/order_info_item.dart';
import 'package:payment_app/features/check_out/presentation/widgets/payment_method_bottom_sheat.dart';
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
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckOutRepoImpl()),
                      child: const PaymentMethodBottomSheat(),
                    );
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
