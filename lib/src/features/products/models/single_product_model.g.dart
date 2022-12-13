// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleProductModel _$SingleProductModelFromJson(Map<String, dynamic> json) =>
    SingleProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      noInStock: json['noInStock'] as int,
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$SingleProductModelToJson(SingleProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'noInStock': instance.noInStock,
      'isAvailable': instance.isAvailable,
    };
