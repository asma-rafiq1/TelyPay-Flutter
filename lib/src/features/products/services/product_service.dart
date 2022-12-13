import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mock_flutter_app/src/features/products/models/products_model.dart';
import 'package:mock_flutter_app/src/navigation/route_names.dart';
import 'package:mock_flutter_app/src/repository/product/http_product_repository.dart';
import 'package:mock_flutter_app/src/repository/product/product_repository.dart';
import 'package:http/http.dart' as http;
import '../../../utils/app_endpoints.dart';
import '../models/single_product_model.dart';

class ProductService with ChangeNotifier {
  final ProductRepository _productRepository = HttpProductRepository();
  var productsModel = ProductsModel(
      products: [],
      productCount: 0,
      averageProductsPrice: 0.0,
      availableStock: 0);

  void getProductsList() async {
    http.Response response;
    List<SingleProductModel> productsList = [];
    ProductsModel productModel = ProductsModel(
        products: [],
        productCount: 0,
        averageProductsPrice: 0.0,
        availableStock: 0);
    response = await _productRepository
        .getProductsApi(ApplicationEndpoints.productsListApiEndpoint)
        .onError((error, stackTrace) {
      //Utils.showFlushBar(context, error.toString());
    });

    for (int i = 0; i < jsonDecode(response.body).length; i++) {
      productsList.add(
        SingleProductModel.fromJson(
          jsonDecode(response.body)[i],
        ),
      );
    }
    productModel.products = productsList;
    var stockAvailable = productsList.map((e) => e.noInStock).toList();
    productModel.availableStock = productModel.availableStock =
        stockAvailable.reduce((value, element) => value + element);
    var productPriceList = productsList.map((e) => e.price).toList();
    productModel.averageProductsPrice =
        (productPriceList.reduce((value, element) => value + element)) / 2;
    productsModel = productModel;
    print(productModel.products.toString());
    notifyListeners();
  }

  void UpdateProductList(SingleProductModel product, BuildContext context) {
    productsModel.products.forEach((element) {
      if (element.id == product.id) {
        productsModel.products
            .removeWhere((element) => element.id == product.id);
        productsModel.products.add(product);
      }
    });
    Navigator.popAndPushNamed(context, RouteName.home);
    notifyListeners();
  }

  void DeleteProduct(int id) {
    productsModel.products.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void SearchProduct(String name) {
    productsModel.products = productsModel.products
        .where((element) => element.name == name)
        .toList();
    notifyListeners();
  }
}
