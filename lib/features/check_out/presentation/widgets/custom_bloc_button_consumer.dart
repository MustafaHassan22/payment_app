import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/check_out/data/models/paymetn_intent_input_model.dart';
import 'package:payment_app/features/check_out/presentation/cubit/cubit/check_out_cubit_cubit.dart';
import 'package:payment_app/features/check_out/presentation/views/thank_you_view.dart';

class CustomBlocButtonConsumer extends StatelessWidget {
  const CustomBlocButtonConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentCubitState>(
      listener: (context, state) {
        if (state is PaymentSucces) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymetnIntentInputModel paymetnIntentInputModel =
                PaymetnIntentInputModel(
                    amount: '100',
                    currency: 'USD',
                    customerId: 'cus_RrLnRxOkGO7PKF');
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymetnIntentInputModel);
          },
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
        );
      },
    );
  }
}
