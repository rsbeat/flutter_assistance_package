class ProductSortModel {
  final bool success;
  final String message;
  final String data;
  ProductSortModel.fromJson(Map<String, dynamic> json)
      : data = json["data"],
        message = json["message"],
        success = json["success"];
}
