import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoping_pp/constant/urls.dart';
import 'package:shoping_pp/data/model/result_api.dart';

class LoginApi {
  login(Map data) async {
    try {
      var url = Uri.parse(urlLogin);

      var respone = await http.post(
        url,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      print(data);
      print(respone.body);
      if (respone.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: respone.body);
      } else {
        return ResultApi(isDone: false, resultOrError: 'Some Error In Server');
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }
}
