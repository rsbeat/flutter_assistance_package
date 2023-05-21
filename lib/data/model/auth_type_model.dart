class AuthTypeModel {
  final bool? success;
  final String? message;
  final List<String>? data;

  AuthTypeModel.fromJson(Map<String, dynamic> json)
      : data = json["data"].cast<String>(),
        message = json["message"],
        success = json["success"];
}
