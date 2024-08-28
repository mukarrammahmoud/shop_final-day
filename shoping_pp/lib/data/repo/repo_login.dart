import 'dart:convert';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shoping_pp/data/api/login_api.dart';
import 'package:shoping_pp/data/model/result_api.dart';
import 'package:shoping_pp/main.dart';

class RepoLogin {
  RepoLogin({required this.loginApi});
  final LoginApi loginApi;
  Future<ResultApi> login(Map data) async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      ResultApi resultApi = await loginApi.login(data);
      if (resultApi.isDone) {
        Map dataToken = jsonDecode(resultApi.resultOrError);
      String  token = dataToken['token'];
        sharedPreferences.setString("token", token);
        return ResultApi(isDone: true, resultOrError: dataToken);
      } else {
        return resultApi;
      }
    } else {
      return ResultApi(isDone: false, resultOrError: "No Internet Access");
    }
  }
}
