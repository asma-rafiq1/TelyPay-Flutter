import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mock_flutter_app/src/exceptions/app_exceptions.dart';

dynamic processResponse({required http.Response response}) {
  var exceptionUrl = response.request?.url.toString();
  switch (response.statusCode) {
    case 200:
      return utf8.decode(response.bodyBytes);
    case 201:
    case 400:
      throw BadRequestException(
          message: utf8.decode(response.bodyBytes), url: exceptionUrl);
    case 401:
      throw UnAuthorizedException(
          message: utf8.decode(response.bodyBytes), url: exceptionUrl);
    case 500:
      throw InternalServerException(
          message: "Server Not Responding. Please Try Again",
          url: exceptionUrl);
    default:
      throw InternalServerException(
          message: "Server Not Responding. Please Try Again",
          url: exceptionUrl);
  }
}
