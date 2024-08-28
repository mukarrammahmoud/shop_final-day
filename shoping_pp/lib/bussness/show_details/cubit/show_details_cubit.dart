import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shoping_pp/config/root/app_root.dart';
import 'package:shoping_pp/main.dart';

part 'show_details_state.dart';

class ShowDetailsCubit extends Cubit<ShowDetailsState> {
  ShowDetailsCubit() : super(const ShowDetailsState());

  incrementQuantity() {
    int add = state.quantity;
    add++;
    emit(state.copywith(
      quantity: add,
    ));
  }

  decrementQuantity() {
    int add = state.quantity;
    add--;
    if (add > 0) {
      emit(state.copywith(
        quantity: add,
      ));
    }
  }

  addToCart(BuildContext context) {
    if (sharedPreferences.getString("token") != null) {
      Navigator.of(context).pushNamed(
        AppRoot.payment,
      );
    } else {
      Navigator.of(context).pushNamed(
        AppRoot.login,
      );
    }
  }
}
