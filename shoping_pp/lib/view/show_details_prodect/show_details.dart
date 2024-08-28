import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_pp/bussness/show_details/cubit/show_details_cubit.dart';
import 'package:shoping_pp/data/model/prodects_model.dart';
import 'package:shoping_pp/view/widgets/custom_button.dart';

class ShowDetailsNews extends StatelessWidget {
  const ShowDetailsNews({
    super.key,
    required this.prodects,
  });
  final Prodects prodects;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowDetailsCubit>(
      create: (context) => ShowDetailsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Details ${prodects.category}"),
        ),
        body: BlocBuilder<ShowDetailsCubit, ShowDetailsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Card(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      prodects.category!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.amber,
                      ),
                    ),
                    Image.network(
                      prodects.image!,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      prodects.title!,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      prodects.description!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Quantity : ",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.cyan,
                          ),
                        ),
                        Text(
                          " ${state.quantity}",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<ShowDetailsCubit, ShowDetailsState>(
                          builder: (context, state) {
                            return CustomButton(
                                title: const Icon(Icons.add),
                                onPressed: () => context
                                    .read<ShowDetailsCubit>()
                                    .incrementQuantity());
                          },
                        ),
                        CustomButton(
                            title: const Icon(Icons.remove),
                            onPressed: () => context
                                .read<ShowDetailsCubit>()
                                .decrementQuantity()),
                      ],
                    ),
                    const Divider(),
                    BlocProvider<ShowDetailsCubit>(
                      create: (context) => ShowDetailsCubit(),
                      child: BlocBuilder<ShowDetailsCubit, ShowDetailsState>(
                        builder: (context, state) {
                          return CustomButton(
                              title: const Text("Add To Cart"),
                              onPressed: () => context
                                  .read<ShowDetailsCubit>()
                                  .addToCart(context));
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
