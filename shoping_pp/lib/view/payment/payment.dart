import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_pp/bussness/cubit/cubit/payment_cubit.dart';
import 'package:shoping_pp/view/login/widget/my_text_field.dart';
import 'package:shoping_pp/view/widgets/custom_button.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Payment"),
        ),
        body: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            return Form(
              key: state.formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    MyTextField(
                      hintText: "Full Name",
                      isVissabileContent: false,
                      validate: (val) {
                        if (val!.isEmpty) return "Field Requaird";
                        return null;
                      },
                      controller: state.fullName,
                      iconPrifex: const Icon(
                        Icons.person,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      hintText: "Phone Number",
                      keyboardType: TextInputType.phone,
                      isVissabileContent: false,
                      validate: (val) {
                        if (val!.isEmpty) return "Field Requaird";
                        return null;
                      },
                      controller: state.fullName,
                      iconPrifex: const Icon(
                        Icons.phone,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      hintText: "Address",
                      isVissabileContent: false,
                      keyboardType: TextInputType.streetAddress,
                      validate: (val) {
                        if (val!.isEmpty) return "Field Requaird";
                        return null;
                      },
                      controller: state.fullName,
                      iconPrifex: const Icon(
                        Icons.local_shipping,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(title: const Text("Buy"), onPressed: () {})
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
