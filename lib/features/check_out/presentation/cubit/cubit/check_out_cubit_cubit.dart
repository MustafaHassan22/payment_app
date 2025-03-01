import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/check_out/data/models/paymetn_intent_input_model.dart';
import 'package:payment_app/features/check_out/data/repo/check_out_repo_impl.dart';
part 'check_out_cubit_state.dart';

class PaymentCubit extends Cubit<PaymentCubitState> {
  final CheckOutRepoImpl checkOutRepoImpl;
  PaymentCubit(this.checkOutRepoImpl) : super(PaymentInitial());

  Future<void> makePayment({
    required PaymetnIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());
    final res = await checkOutRepoImpl.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    res.fold(
      (l) => emit(PaymentFailure(errMessage: l.errMessage)),
      (r) => emit(PaymentSucces()),
    );
  }

  @override
  void onChange(Change<PaymentCubitState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
