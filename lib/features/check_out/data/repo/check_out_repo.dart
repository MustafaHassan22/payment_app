import 'package:dartz/dartz.dart';
import 'package:payment_app/core/errors/failure.dart';
import 'package:payment_app/features/check_out/data/models/paymetn_intent_input_model.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymetnIntentInputModel paymentIntentInputModel,
  });
}
