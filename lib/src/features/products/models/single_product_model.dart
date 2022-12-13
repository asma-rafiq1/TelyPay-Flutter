import 'package:json_annotation/json_annotation.dart';
part 'single_product_model.g.dart';

@JsonSerializable()
class SingleProductModel {
  int id;
  String name;
  double price;
  int noInStock;
  bool isAvailable;

  SingleProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.noInStock,
    required this.isAvailable,
  });

  //From Json
  factory SingleProductModel.fromJson(Map<String, dynamic> map) =>
      _$SingleProductModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$SingleProductModelToJson(this);
}
