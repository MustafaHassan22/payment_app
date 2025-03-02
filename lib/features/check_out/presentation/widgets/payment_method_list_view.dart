import 'package:flutter/widgets.dart';
import 'package:payment_app/features/check_out/presentation/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  final Function(int) onPaymentMethodSelected;
  const PaymentMethodsListView(
      {super.key, required this.onPaymentMethodSelected});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItem = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg'
  ];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethodsItem.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
                widget.onPaymentMethodSelected(index);
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                image: paymentMethodsItem[index],
              ),
            );
          }),
    );
  }
}
