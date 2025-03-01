import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/features/check_out/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_app/features/check_out/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment_app/features/check_out/data/models/payment_sheet_input_model.dart';
import 'package:payment_app/features/check_out/data/models/paymetn_intent_input_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymetnIntentInputModel paymentIntentInputModel,
  ) async {
    try {
      var res = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        contentType: Headers.formUrlEncodedContentType,
        token: ApiKeys.secretKey,
      );

      var paymentIntentModel = PaymentIntentModel.fromJson(res.data);
      return paymentIntentModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    try {
      var res = await apiService.post(
        body: {'customer': customerId},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        contentType: Headers.formUrlEncodedContentType,
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2025-02-24.acacia',
        },
      );

      var ephemeralKeyModel = EphemeralKeyModel.fromJson(res.data);
      return ephemeralKeyModel;
    } catch (e) {
      rethrow;
    }
  }

  Future initPaymentSheet(
      {required PaymentSheetInputModel paymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret: paymentSheetInputModel.ephemeralKey,
        customerId: paymentSheetInputModel.customerId,
        merchantDisplayName: 'Mustafa',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

//this fun to triger all the 4 fun, the first point
  Future makePayment({
    required PaymetnIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      var paymentIntentModel =
          await createPaymentIntent(paymentIntentInputModel);
      var ephemeralKeyModel = await createEphemeralKey(
          customerId: paymentIntentInputModel.customerId);
      // await createPaymentIntent(paymentIntentInputModel);
      var paymentSheetInputModel = PaymentSheetInputModel(
          clientSecret: paymentIntentModel.clientSecret!,
          customerId: paymentIntentInputModel.customerId,
          ephemeralKey: ephemeralKeyModel.secret!);
      await initPaymentSheet(paymentSheetInputModel: paymentSheetInputModel);
      await displayPaymentSheet();
    } catch (e) {
      // Show an error message to the user
    }
  }
}

//create payment intent(amount,currecy,customerId) \\ paymentIntentObject
//keySecret(best to make it an object) createEphemeralKey( customerId)
//init payment sheet  (merchiantDisplayName,paymentIntentClientSecret,ephemeralKey)
//presentPaymentSheet()
