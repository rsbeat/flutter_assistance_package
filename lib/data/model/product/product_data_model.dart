class ProductDataModel {
  ProductDataModel({
    required this.id,
    required this.type,
    this.supertype,
    required this.ageRange,
    required this.supportType,
    required this.slug,
    required this.title,
    this.streamService,
    this.streamId,
    required this.startsAt,
    required this.categoryId,
    required this.preReqs,
    required this.tags,
    this.giftProducts,
    required this.teachers,
    this.mentors,
    required this.estimatedTime,
    this.faculty,
    required this.price,
    required this.maxDiscountPercent,
    required this.status,
    this.bannerUrl,
    this.catalogueUrl,
    required this.isOnSale,
    this.interviewerIds,
    this.personaIds,
    required this.periodMonths,
    this.freeAccess,
    required this.requiredInterview,
    required this.isDownloadable,
    this.saleDays,
    this.cycleDays,
    required this.creatorId,
    required this.createdAt,
    required this.updatedAt,
    required this.itemType,
  });
  late final int id;
  late final int type;
  late final dynamic supertype;
  late final String ageRange;
  late final String supportType;
  late final String slug;
  late final String title;
  late final dynamic streamService;
  late final dynamic streamId;
  late final String startsAt;
  late final int categoryId;
  late final String preReqs;
  late final String tags;
  late final dynamic giftProducts;
  late final List<dynamic> teachers;
  late final dynamic mentors;
  late final int estimatedTime;
  late final dynamic faculty;
  late final int price;
  late final int maxDiscountPercent;
  late final int status;
  late final dynamic bannerUrl;
  late final dynamic catalogueUrl;
  late final int isOnSale;
  late final dynamic interviewerIds;
  late final dynamic personaIds;
  late final int periodMonths;
  late final dynamic freeAccess;
  late final int requiredInterview;
  late final int isDownloadable;
  late final dynamic saleDays;
  late final dynamic cycleDays;
  late final int creatorId;
  late final String createdAt;
  late final String updatedAt;
  late final String itemType;

  static convertToList(List<dynamic> list) {
    final List<ProductDataModel> productdataList = [];
    list.forEach((element) {
      productdataList.add(ProductDataModel.fromJson(element));
    });
    return productdataList;
  }

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    supertype = null;
    ageRange = json['age_range'];
    supportType = json['support_type'];
    slug = json['slug'];
    title = json['title'];
    streamService = null;
    streamId = null;
    startsAt = json['starts_at'];
    categoryId = json['category_id'];
    preReqs = json['pre_reqs'];
    tags = json['tags'];
    giftProducts = null;
    teachers = List.castFrom<dynamic, dynamic>(json['teachers']);
    mentors = null;
    estimatedTime = json['estimated_time'];
    faculty = null;
    price = json['price'];
    maxDiscountPercent = json['max_discount_percent'];
    status = json['status'];
    bannerUrl = null;
    catalogueUrl = null;
    isOnSale = json['is_on_sale'];
    interviewerIds = null;
    personaIds = null;
    periodMonths = json['period_months'];
    freeAccess = null;
    requiredInterview = json['required_interview'];
    isDownloadable = json['is_downloadable'];
    saleDays = null;
    cycleDays = null;
    creatorId = json['creator_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    itemType = json['item_type'];
  }
}
