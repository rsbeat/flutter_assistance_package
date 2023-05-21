class OTPModel {
  bool? success;
  String? message;
  Data? data;

  OTPModel({this.success, this.message, this.data});

  OTPModel.fromJson(Map<String, dynamic> json) :
    success = json['success'],
    message = json['message'],
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
}

class Data {
  String? token;

  Data({this.token});

  Data.fromJson(Map<String, dynamic> json) : token = json['token'];
}