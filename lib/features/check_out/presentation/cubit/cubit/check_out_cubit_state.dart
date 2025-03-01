part of 'check_out_cubit_cubit.dart';

@immutable
sealed class PaymentCubitState {}

final class PaymentInitial extends PaymentCubitState {}

final class PaymentLoading extends PaymentCubitState {}

final class PaymentSucces extends PaymentCubitState {}

final class PaymentFailure extends PaymentCubitState {
  final String errMessage;

  PaymentFailure({required this.errMessage});
}
