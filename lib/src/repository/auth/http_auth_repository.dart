import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mock_flutter_app/src/repository/auth/auth_repository.dart';
import 'package:http/http.dart' as http;

import '../../exceptions/app_exceptions.dart';
import '../../utils/app_endpoints.dart';
import '../process_response.dart';

class HttpAuthRepository extends AuthRepository {
  @override
  Future loginApi(String url, Map<String, dynamic> payloadObj) async {
    http.Response response;
    try {
      var uri = Uri.parse(url);
      var bodyObj = jsonEncode(payloadObj);
      var headers = {"Content-Type": "application/json"};
      response = await http
          .post(uri, body: bodyObj, headers: headers)
          .timeout(Duration(seconds: ApplicationEndpoints.timeOutDuration));
      return processResponse(response: response);
    } on SocketException {
      throw NetworkErrorException(
          message: 'No Internet Connection. Please Try again', url: url);
    } on TimeoutException {
      throw DownTimeException(
          message: 'Unable to Process.Please Try again', url: url);
    } catch (err) {
      throw Exception("Please try after sometime");
    }
  }
}
