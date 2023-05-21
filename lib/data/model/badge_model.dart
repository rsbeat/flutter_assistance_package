class BadgeModel {
  bool? success;
  String? message;
  Data? data;

  BadgeModel({this.success, this.message, this.data});

  BadgeModel.fromJson(Map<String, dynamic> json) {
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
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
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
    this.total,
  });

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
  String? nameEn;
  String? nameFa;
  String? iconImage;
  String? iconCode;
  bool? isActive;
  String? badgeGroup;
  int? orderInGroup;
  AssignmentConditions? assignmentConditions;
  Payload? payload;
  String? createdAt;
  String? updatedAt;

  DataDetail(
      {this.id,
      this.nameEn,
      this.nameFa,
      this.iconImage,
      this.iconCode,
      this.isActive,
      this.badgeGroup,
      this.orderInGroup,
      this.assignmentConditions,
      this.payload,
      this.createdAt,
      this.updatedAt});

  DataDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameFa = json['name_fa'];
    iconImage = json['icon_image'];
    iconCode = json['icon_code'];
    isActive = json['is_active'];
    badgeGroup = json['badge_group'];
    orderInGroup = json['order_in_group'];
    assignmentConditions = AssignmentConditions.fromJson(json['assignment_conditions']);
    payload = Payload.fromJson(json['payload']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class AssignmentConditions {
  List<String>? roles;
  RequiredUnits? requiredUnits;

  AssignmentConditions({this.roles, this.requiredUnits});

  AssignmentConditions.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>();
    requiredUnits = RequiredUnits.fromJson(json['required_units']);
  }
}

class RequiredUnits {
  int? i1;

  RequiredUnits({this.i1});

  RequiredUnits.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
  }
}

class Payload {
  String? title;
  String? description;

  Payload({this.title, this.description});

  Payload.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
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
