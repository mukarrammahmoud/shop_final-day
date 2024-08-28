import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_pp/bussness/cubit/login/cubit/login_cubit.dart';
import 'package:shoping_pp/data/api/login_api.dart';
import 'package:shoping_pp/data/repo/repo_login.dart';
import 'package:shoping_pp/view/login/widget/my_text_field.dart';
import 'package:shoping_pp/view/widgets/custom_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) =>
          LoginCubit(repoLogin: RepoLogin(loginApi: LoginApi())),
      child: Scaffold(
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Center(
              child: Form(
                key: state.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login In App",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.cyan,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      hintText: "User Name",
                      isVissabileContent: false,
                      validate: (val) {
                        if (val!.isEmpty) return "Field Requaird";
                        return null;
                      },
                      controller: state.userController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      hintText: "password",
                      isVissabileContent: state.showPassword,
                      validate: (val) {
                        if (val!.isEmpty) return "Field Requaird";
                        return null;
                      },
                      icon: IconButton(
                        icon: Icon(state.showPassword == true
                            ? Icons.visibility
                            : Icons.visibility),
                        onPressed: () =>
                            context.read<LoginCubit>().showHidePassword(),
                      ),
                      controller: state.passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return CustomButton(
                            title: const Text("Login"),
                            onPressed: () =>
                                context.read<LoginCubit>().login(context));
                      },
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
