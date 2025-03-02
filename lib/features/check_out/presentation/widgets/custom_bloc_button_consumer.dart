import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
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
            // PaymetnIntentInputModel paymetnIntentInputModel =
            //     PaymetnIntentInputModel(
            //         amount: '100',
            //         currency: 'USD',
            //         customerId: 'cus_RrLnRxOkGO7PKF');
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymetnIntentInputModel);

            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckoutView(
                sandboxMode: true,
                clientId:
                    "AZHxgWwJRYfyerKQrKBqogWi71nct7s6NWlDAwYHscDzkhd87RxT-iE5LKJ4S6TNWoojzbn3f4qp1Zsh",
                secretKey:
                    "ELgY0lScMG0XeTBo8msi5Oz_F0-Fv1PObEpO3NtKl4OHZSi6lvWA00oW9cN1ylU9QAh9buuYJ4RNLDVa",
                transactions: const [
                  {
                    "amount": {
                      "total": '70',
                      "currency": "USD",
                      "details": {
                        "subtotal": '70',
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    "item_list": {
                      "items": [
                        {
                          "name": "Apple",
                          "quantity": 4,
                          "price": '5',
                          "currency": "USD"
                        },
                        {
                          "name": "Pineapple",
                          "quantity": 5,
                          "price": '10',
                          "currency": "USD"
                        }
                      ],
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  print("onSuccess: $params");
                },
                onError: (error) {
                  print("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                },
              ),
            ));
          },
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
        );
      },
    );
  }
}
