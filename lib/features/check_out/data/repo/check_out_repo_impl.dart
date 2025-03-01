import 'package:dartz/dartz.dart';
import 'package:payment_app/core/errors/failure.dart';
import 'package:payment_app/core/utils/stripe_service.dart';
import 'package:payment_app/features/check_out/data/models/paymetn_intent_input_model.dart';
import 'package:payment_app/features/check_out/data/repo/check_out_repo.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymetnIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
