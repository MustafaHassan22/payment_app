import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/check_out/data/models/amout_model/amout_model.dart';
import 'package:payment_app/features/check_out/data/models/amout_model/details.dart';
import 'package:payment_app/features/check_out/data/models/item_list_model/item.dart';
import 'package:payment_app/features/check_out/data/models/item_list_model/item_list_model.dart';
import 'package:payment_app/features/check_out/data/models/paymetn_intent_input_model.dart';
import 'package:payment_app/features/check_out/presentation/cubit/cubit/check_out_cubit_cubit.dart';
import 'package:payment_app/features/check_out/presentation/views/thank_you_view.dart';

class CustomBlocButtonConsumer extends StatelessWidget {
  final int selectedPaymentMethodIndex;
  const CustomBlocButtonConsumer({
    super.key,
    required this.selectedPaymentMethodIndex,
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
            print("Executing payment for index: $selectedPaymentMethodIndex");
            if (selectedPaymentMethodIndex == 0) {
              //stripe

              PaymetnIntentInputModel paymetnIntentInputModel =
                  PaymetnIntentInputModel(
                      amount: '100',
                      currency: 'USD',
                      customerId: 'cus_RrLnRxOkGO7PKF');
              BlocProvider.of<PaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymetnIntentInputModel);
            } else {
              //paypal
              var transactionData = getTransactionData();
              excutePaypalPayment(context, transactionData);
            }
          },
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
        );
      },
    );
  }

  void excutePaypalPayment(BuildContext context,
      ({AmoutModel amount, ItemListModel itemlist}) transactionData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionData.itemlist.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return ThankYouView();
            }));
          },
          onError: (error) {
            print("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }
}

({AmoutModel amount, ItemListModel itemlist}) getTransactionData() {
  var amount = AmoutModel(
    currency: 'USD',
    total: '100',
    details: Details(
      shipping: '0',
      shippingDiscount: 0,
      subtotal: '100',
    ),
  );
  List<OrderItemModel> orders = [
    OrderItemModel(
      currency: 'USD',
      name: "Apple",
      price: '4',
      quantity: 10,
    ),
    OrderItemModel(
      currency: 'USD',
      name: "Apple",
      price: '5',
      quantity: 12,
    ),
  ];
  var itemList = ItemListModel(items: orders);

  return (amount: amount, itemlist: itemList);
}
