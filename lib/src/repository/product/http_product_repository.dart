import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mock_flutter_app/src/exceptions/app_exceptions.dart';
import 'package:mock_flutter_app/src/repository/process_response.dart';
import 'package:mock_flutter_app/src/repository/product/product_repository.dart';
import 'package:mock_flutter_app/src/utils/app_endpoints.dart';

class HttpProductRepository extends ProductRepository {
  @override
  Future<dynamic> getProductsApi(String url) async {
    http.Response response;
    try {
      var uri = Uri.parse(url);
      response = await http
          .get(uri)
          .timeout(Duration(seconds: ApplicationEndpoints.timeOutDuration));
      return response;
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
