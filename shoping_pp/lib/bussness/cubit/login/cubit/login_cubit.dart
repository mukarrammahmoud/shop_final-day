// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoping_pp/config/root/app_root.dart';
import 'package:shoping_pp/config/status.dart';
import 'package:shoping_pp/data/model/result_api.dart';
import 'package:shoping_pp/data/repo/repo_login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.repoLogin,
  }) : super(LoginState(
            formKey: GlobalKey(),
            passwordController: TextEditingController(),
            userController: TextEditingController()));
  final RepoLogin repoLogin;
  navigateToSignUp(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoot.login);
  }

  void showHidePassword() {
    emit(state.copyWith(
      showPassword: !state.showPassword,
    ));
  }

  login(BuildContext context) async {
    if (state.formKey.currentState!.validate()) {
      emit(state.copyWith(
        loadingType: LoadingType.loading,
      ));
      String userName = state.userController.text;
      String password = state.passwordController.text;
      Map dataLogin = {
        "username": userName,
        "password": password,
      };
      ResultApi resultApi = await repoLogin.login(dataLogin);
      if (resultApi.isDone) {
        Map token = resultApi.resultOrError;
        // var data = resultApi.dataOrError["data"];
        print(token);
        if (isClosed) return;

        emit(state.copyWith(
          loadingType: LoadingType.successful,
        ));

        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoot.home, (route) => false);
      }
    }
  }
}
