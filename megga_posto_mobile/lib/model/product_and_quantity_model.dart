// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:megga_posto_mobile/model/collections/product.dart';

class ProductAndQuantityModel {
  Product? product;
  int? quantity;

  ProductAndQuantityModel({
    this.product,
    this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': product?.toMap(),
      'quantity': quantity,
    };
  }

  factory ProductAndQuantityModel.fromMap(Map<String, dynamic> map) {
    return ProductAndQuantityModel(
      product: map['products'] != null
          ? Product.fromMap(map['products'] as Map<String, dynamic>)
          : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductAndQuantityModel.fromJson(String source) =>
      ProductAndQuantityModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
