// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymetnIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymetnIntentInputModel(
      {required this.amount, required this.currency, required this.customerId});

  toJson() {
    return {'amount': amount, 'currency': currency, 'customer': customerId};
  }
  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'amount': amount,
  //     'currency': currency,
  //   };
  // }

  // factory PaymetnIntentInputModel.fromMap(Map<String, dynamic> map) {
  //   return PaymetnIntentInputModel(
  //     amount: map['amount'] as String,
  //     currency: map['currency'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory PaymetnIntentInputModel.fromJson(String source) =>
  //     PaymetnIntentInputModel.fromMap(
  //         json.decode(source) as Map<String, dynamic>);
}
