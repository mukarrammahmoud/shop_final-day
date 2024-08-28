import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit()
      : super(PaymentState(
            formKey: GlobalKey(),
            fullName: TextEditingController(),
            phoneNumber: TextEditingController(),
            shhippingAddress: TextEditingController()));
}
