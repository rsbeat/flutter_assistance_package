class RegisterModel {
  final bool? success;
  final String? message;
  final List<String>? data;

  RegisterModel.fromJson(Map<String, dynamic> json)
      : data = json["data"].cast<String>(),
        message = json["message"],
        success = json["success"];
}
