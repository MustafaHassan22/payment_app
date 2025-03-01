class PaymentSheetInputModel {
  final String clientSecret;
  final String customerId;
  final String ephemeralKey;

  PaymentSheetInputModel({
    required this.clientSecret,
    required this.customerId,
    required this.ephemeralKey,
  });
}
