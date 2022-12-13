import 'package:mock_flutter_app/src/features/products/models/single_product_model.dart';

class ProductsModel {
  List<SingleProductModel> products;
  int productCount;
  double averageProductsPrice;
  int availableStock;
  ProductsModel({
    required this.products,
    required this.productCount,
    required this.averageProductsPrice,
    required this.availableStock,
  });
}
