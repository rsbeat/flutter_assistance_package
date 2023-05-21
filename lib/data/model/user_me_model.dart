class UserMeModel {
  bool? success;
  String? message;
  Data? data;

  UserMeModel({this.success, this.message, this.data});

  UserMeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] = Data.fromJson(json['data']);
  }
}

class Data {
  int? id;
  String? email;
  String? password;
  String? mobile;
  dynamic? slug;
  String? code;
  String? realName;
  String? displayName;
  List<dynamic>? roles;
  int? isBlocked;
  String? funnelStatus;
  dynamic? funnelMeta;
  dynamic? badges;
  dynamic? userAnswers;
  dynamic? personaMatch;
  int? walletBalance;
  dynamic? gender;
  dynamic? birthDate;
  dynamic? city;
  dynamic? permissions;
  dynamic? activationKey;
  String? meta;
  int? paymentCount;
  int? paymentSum;
  int? paymentAvg;
  dynamic? lastPaymentAt;
  dynamic? lastEnrollmentAt;
  dynamic? lastLoginAt;
  String? lastActiveAt;
  dynamic? createdAtFa;
  dynamic? createdAt;
  dynamic? updatedAt;

  Data(
      {this.id,
      this.email,
      this.password,
      this.mobile,
      this.slug,
      this.code,
      this.realName,
      this.displayName,
      this.roles,
      this.isBlocked,
      this.funnelStatus,
      this.funnelMeta,
      this.badges,
      this.userAnswers,
      this.personaMatch,
      this.walletBalance,
      this.gender,
      this.birthDate,
      this.city,
      this.permissions,
      this.activationKey,
      this.meta,
      this.paymentCount,
      this.paymentSum,
      this.paymentAvg,
      this.lastPaymentAt,
      this.lastEnrollmentAt,
      this.lastLoginAt,
      this.lastActiveAt,
      this.createdAtFa,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    slug = json['slug'];
    code = json['code'];
    realName = json['real_name'];
    displayName = json['display_name'];
    // if (json['roles'] != null) {
    //   roles = <Null>[];
    //   json['roles'].forEach((v) {
    //     roles!.add(Null.fromJson(v));
    //   });
    // }
    isBlocked = json['is_blocked'];
    funnelStatus = json['funnel_status'];
    funnelMeta = json['funnel_meta'];
    badges = json['badges'];
    userAnswers = json['user_answers'];
    personaMatch = json['persona_match'];
    walletBalance = json['wallet_balance'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    city = json['city'];
    permissions = json['permissions'];
    activationKey = json['activation_key'];
    meta = json['meta'];
    paymentCount = json['payment_count'];
    paymentSum = json['payment_sum'];
    paymentAvg = json['payment_avg'];
    lastPaymentAt = json['last_payment_at'];
    lastEnrollmentAt = json['last_enrollment_at'];
    lastLoginAt = json['last_login_at'];
    lastActiveAt = json['last_active_at'];
    createdAtFa = json['created_at_fa'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
