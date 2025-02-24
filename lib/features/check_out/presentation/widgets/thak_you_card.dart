import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/features/check_out/presentation/widgets/custom_card_info.dart';
import 'package:payment_app/features/check_out/presentation/widgets/payment_item_info.dart';
import 'package:payment_app/features/check_out/presentation/widgets/total_into_item.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xffD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16),
        child: Column(
          children: [
            const Text(
              'Thank You',
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              style: Styles.style20,
            ),
            const SizedBox(
              height: 25,
            ),
            const PaymentItemInfo(title: 'Date', content: '01/24/2023'),
            const PaymentItemInfo(title: 'Time', content: '10:15 AM'),
            const PaymentItemInfo(title: 'To', content: 'Sam Louis'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                height: 60,
                thickness: 2,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TotalInfo(
                title: 'Total',
                value: r'$50.97',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomCardInfo(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.barcode,
                    size: 70,
                  ),
                  Container(
                    width: 113,
                    height: 58,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1.50,
                          color: Color(0xff34a853),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'PAID',
                        style: Styles.style24
                            .copyWith(color: const Color(0xff34a853)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: ((MediaQuery.of(context).size.height * .2 + 20) / 2) - 29,
            )
          ],
        ),
      ),
    );
  }
}
