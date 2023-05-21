import 'package:flutter_assistant_package/data/model/product/product_data_model.dart';

class ProductSearchModel {
  final bool success;
  final String message;
  final List<ProductDataModel> data;

  ProductSearchModel.fromJson(Map<String, dynamic> json)
      : data = ProductDataModel.convertToList(json["data"]),
        message = json["message"],
        success = json["success"];
}
