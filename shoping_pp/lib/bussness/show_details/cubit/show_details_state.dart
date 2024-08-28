part of 'show_details_cubit.dart';

class ShowDetailsState extends Equatable {
  const ShowDetailsState({
    this.quantity = 1,
  });
  final int quantity;
  @override
  List<Object> get props => [quantity];
  ShowDetailsState copywith({
    int? quantity,
  }) =>
      ShowDetailsState(
        quantity: quantity??this.quantity
      );
}
