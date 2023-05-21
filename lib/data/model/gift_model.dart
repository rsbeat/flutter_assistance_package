class GiftModel {
  bool? success;
  String? message;
  Data? data;

  GiftModel({this.success, this.message, this.data});

  GiftModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class DataDetail {
  int? id;
  int? organizationId;
  int? creatorId;
  String? title;
  String? description;
  int? priceValue;
  String? accessMode;
  String? giftType;
  Null? giftMeta;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  Organization? organization;
  Creator? creator;

  DataDetail(
      {this.id,
        this.organizationId,
        this.creatorId,
        this.title,
        this.description,
        this.priceValue,
        this.accessMode,
        this.giftType,
        this.giftMeta,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.organization,
        this.creator});

  DataDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationId = json['organization_id'];
    creatorId = json['creator_id'];
    title = json['title'];
    description = json['description'];
    priceValue = json['price_value'];
    accessMode = json['access_mode'];
    giftType = json['gift_type'];
    giftMeta = json['gift_meta'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    organization = Organization.fromJson(json['organization'])
        ;
    creator =Creator.fromJson(json['creator']);
  }
}

class Organization {
  int? id;
  int? ownerId;
  int? parentId;
  int? maxDiscountPercent;
  String? slug;
  String? size;
  String? type;
  String? nameFa;
  String? nameEn;
  String? logoUrl;
  String? description;
  dynamic? supervisorsId;
  dynamic? payload;
  dynamic? deletedAt;
  String? createdAt;
  String? updatedAt;

  Organization(
      {this.id,
        this.ownerId,
        this.parentId,
        this.maxDiscountPercent,
        this.slug,
        this.size,
        this.type,
        this.nameFa,
        this.nameEn,
        this.logoUrl,
        this.description,
        this.supervisorsId,
        this.payload,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    parentId = json['parent_id'];
    maxDiscountPercent = json['max_discount_percent'];
    slug = json['slug'];
    size = json['size'];
    type = json['type'];
    nameFa = json['name_fa'];
    nameEn = json['name_en'];
    logoUrl = json['logo_url'];
    description = json['description'];
    supervisorsId = json['supervisors_id'];
    payload = json['payload'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Creator {
  int? id;
  String? email;
  String? password;
  String? mobile;
  dynamic slug;
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
  List<String>? permissions;
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

  Creator(
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

  Creator.fromJson(Map<String, dynamic> json) {
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
    //     roles!.add(new Null.fromJson(v));
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
    permissions = json['permissions'].cast<String>();
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}
