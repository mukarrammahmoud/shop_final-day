part of 'payment_cubit.dart';

class PaymentState extends Equatable {
  const PaymentState({
    required this.formKey,
    required this.shhippingAddress,
    required this.fullName,
    required this.phoneNumber,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController fullName;
  final TextEditingController phoneNumber;
  final TextEditingController shhippingAddress;

  @override
  List<Object> get props => [
        formKey,
        shhippingAddress,
        fullName,
        phoneNumber,
      ];
  PaymentState copyWith({
    GlobalKey<FormState>? formKey,
    TextEditingController? shhippingAddress,
    TextEditingController? phoneNumber,
    TextEditingController? fullName,
   
  }) =>
      PaymentState(
        formKey: formKey ?? this.formKey,
        fullName: fullName??this.fullName,
        phoneNumber: phoneNumber??this.phoneNumber,
        shhippingAddress: shhippingAddress ??this.shhippingAddress,
      );
}
